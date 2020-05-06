" === General settings === "

" use coc.nvim as data provider
let g:vista_default_executive = 'coc'

" sidebar appearance
let g:vista_sidebar_width = 45

" preview the selected symbol in sidebar
" inside a floating window without any delay
let g:vista_echo_cursor_strategy = 'floating_win'
let g:vista_cursor_delay = 0
let g:vista_floating_delay = 0

" update the sidebar as the buffer changes
let g:vista_update_on_text_changed = 1

" when opening jump to the sidebar
" and close on selection
let g:vista_stay_on_open = 1
let g:vista_close_on_jump = 1

" disable blinking
let g:vista_blink = [0, 0]
let g:vista_top_level_blink = [0, 0]


" === Bindings === "

" toggle the sidebar
nnoremap <silent> <leader>lO :<c-u>Vista!!<CR>


" === Hooks === "

" close vim when o
autocmd bufenter * if (winnr("$") == 1 && exists('*vista#sidebar#IsVisible') && vista#sidebar#IsVisible()) | q | endif
