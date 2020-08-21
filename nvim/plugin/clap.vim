let g:clap_disable_run_rooter = v:false
let g:clap_popup_border = 'sharp'
let g:clap_theme = 'nord'
let g:clap_layout = { 'relative': 'editor' }
let g:clap_project_root_markers = ['.svn', '.git', '.git/','.hg','.hg/' , '.idea', '.idea/', '.project']
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

" grep: Grep on the fly with rg
" grep2: Grep on the fly with cache and dynamic results with maple
nnoremap <silent> <leader>sn:<C-u>Clap grep2 +no-cache<CR>
nnoremap <silent> <leader>ss :<C-u>Clap grep2<CR>
nnoremap <silent> <leader>ff  :<C-u>Clap files<CR>
nnoremap <silent> <leader>fp  :<C-u>Clap filer<CR>
nnoremap <silent> <leader>st :<C-u>Clap tags<CR>
nnoremap <silent> <leader>sT :<C-u>Clap proj_tags<CR>
nnoremap <silent> <leader>bb :<C-u>Clap buffers<CR>
nnoremap <silent> <leader>C :<C-u>Clap<CR>
cnoreabbrev dot Clap dotfiles

