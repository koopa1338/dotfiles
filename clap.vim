let g:clap_disable_run_rooter = v:false
let g:clap_popup_border = 'sharp'
let g:clap_theme = 'nord'
let g:clap_layout = { 'relative': 'editor', 'row': '15%' }
let g:clap_project_root_markers = ['.svn', '.git', '.git/','.hg','.hg/' , '.idea', '.idea/', '.project']

" grep: Grep on the fly with rg
" grep2: Grep on the fly with cache and dynamic results with maple
nnoremap <silent> <leader>sn :<C-u>Clap grep2 +no-cache<CR>
nnoremap <silent> <leader>ss :<C-u>Clap grep2<CR>
nnoremap <silent> <leader>ff :<C-u>Clap files<CR>
nnoremap <silent> <leader>fp :<C-u>Clap filer<CR>
nnoremap <silent> <leader>st :<C-u>Clap tags<CR>
nnoremap <silent> <leader>sT :<C-u>Clap proj_tags<CR>
nnoremap <silent> <leader>bb :<C-u>Clap buffers<CR>
nnoremap <silent> <leader>gg :<C-u>Clap git_branches<CR>
nnoremap <silent> <leader>C :<C-u>Clap<CR>

let g:clap_provider_dotfiles = {
    \ 'source': [
        \ '~/dotfiles/nvim/init.vim',
        \ '~/dotfiles/config',
        \ '~/dotfiles/nvim/coc-settings.json',
        \ '~/dotfiles/fish/config.fish',
        \ '~/dotfiles/nvim/plugin/coc.vim',
        \ '~/dotfiles/nvim/plugin/clap.vim'
    \ ],
    \ 'sink': 'e',
\ }
cnoreabbrev dot Clap dotfiles

const s:format = shellescape(
      \ '%(refname:short)  ' ..
      \ '%(subject) ' ..
      \ '%(committerdate:relative) ' ..
      \ '-> %(objectname:short)'
      \)

function! s:gitbranch_source_impl() abort
    let l:git_cmd = printf('git branch --all --sort=refname:short --format=%s', s:format)

    let l:git_output = split(system(l:git_cmd), '\n')
    " Delete the current and HEAD from the list.
    let l:current = s:get_current_ref()
    call s:remove_branch(l:git_output, escape(l:current, '/'))
    call s:remove_branch(l:git_output, '\(origin/\)\?HEAD')
    return l:git_output
endfunction

function! s:gitbranch_sink_impl(lines)
    if len(a:lines) < 2
        return
    endif

    let l:elements = split(a:lines)
    let l:branch = l:elements[0]
    let l:branch_remote = split(l:branch, '/')
    let l:execute_command = 'G co {branch}'
    if len(l:branch_remote) > 1
        let l:local_branches = system('git branch')
        let l:branch_trimmed = join(l:branch_remote[1:-1])
        if len(matchstr(l:local_branches, l:branch_trimmed)) > 0
            if len(l:is_local) > 0
                let l:branch = l:branch_trimmed
            else
                let l:execute_command = 'G co --track {branch}'
            endif
        endif
    endif

    let l:execute_command = substitute(l:execute_command, '{branch}', shellescape(l:branch), 'g')
    execute l:execute_command
endfunction

let g:clap_provider_git_branches = {
    \ 'source': function('s:gitbranch_source_impl'),
    \ 'sink': function('s:gitbranch_sink_impl'),
\ }

function! s:remove_branch(branches, pattern)
    " Find first occurrence and remove it
    const l:index = match(a:branches, '^' .. a:pattern)
    if (l:index != -1)
        call remove(a:branches, l:index)
        return v:true
    endif
    return v:false
endfunction

function! s:get_current_ref()
    let l:current = system('git symbolic-ref --short -q HEAD || git rev-parse --short HEAD')
    let l:current = substitute(l:current, '\n', '', 'g')
    return l:current
endfunction
