let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--layout=reverse --color=bg+:8,fg:10,fg+:15,pointer:14,spinner:9,info:7'

nnoremap <silent> <leader>fg :<C-u>:GFiles<CR>
nnoremap <silent> <leader>ff :<C-u>:Files<CR>
nnoremap <silent> <leader>fr :<C-u>:Rg<CR>
nnoremap <silent> <leader>ft :<C-u>:BTags<CR>
nnoremap <silent> <leader>fT :<C-u>:Tags<CR>
nnoremap <silent> <leader>bb :<C-u>:Buffers<CR>
nnoremap <silent> <leader>fw :<C-u>:Windows<CR>
nnoremap <silent> <leader>fG :<C-u>:GBranches<CR>
