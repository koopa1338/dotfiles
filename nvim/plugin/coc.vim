" Bindings for the symbol under the cursor
"  <leader>lc   - list references
"  <leader>lj   - jump to definition
"  <leader>li   - list implementations
"  <leader>li   - diagnostic info
"  <leader>lr   - rename
"  <leader>lt   - jump to type definition
"  <leader>ld   - show documentation
"  K            - show documentation
nmap <silent> <leader>lr <Plug>(coc-references)
nmap <silent> <leader>ld <Plug>(coc-definition)
nmap <silent> <leader>lD <Plug>(coc-declaration)
nmap <silent> <leader>li <Plug>(coc-implementation)
nmap <silent> <leader>lI <Plug>(coc-diagnostic-info)
nmap <silent> <leader>ln <Plug>(coc-rename)
nmap <silent> <leader>lt <Plug>(coc-type-definition)
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Completion
"   <ctrl><space>   - show completion candidates
" When completions are shown
"   <tab>           - select next completion
"   <shift><tab>    - select previous completion
"   <cr>            - expands if selection is a snippet
inoremap <silent><expr> <C-SPACE> coc#refresh()
inoremap <silent><expr> <TAB>
    \ pumvisible() ? '<C-n>' :
    \ <SID>check_back_space() ? '<TAB>' :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? '<C-p>' : '<C-h>'
inoremap <expr> <CR> pumvisible() ? '<C-y>' : '<CR>'
imap <expr><CR> pumvisible() ? '<C-y>' : '<Plug>(PearTreeExpand)'

" commands
command! -nargs=0 Format :call CocAction('format')

" functions
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction
