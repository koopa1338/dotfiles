"       __     __ ___  __  __  ____    ____ 
"       \ \   / /|_ _||  \/  ||  _ \  / ___|
"        \ \ / /  | | | |\/| || |_) || |    
"         \ V /   | | | |  | ||  _ < | |___ 
"          \_/   |___||_|  |_||_| \_\ \____|

" settings
set spelllang=de
set encoding=utf-8
set cmdheight=2
set noswapfile
syntax enable
set nocompatible

set hlsearch
set incsearch
set ignorecase
set smartcase

filetype off
set shell=fish
set mps+=<:>

" line numbers
set rnu
set nu
set ruler

set wildmenu

" linebreaks
set shiftwidth=4
set tabstop=4
set laststatus=2
set linebreak
" set list
" set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,nbsp:⊙
set wrap
set breakindent
set breakindentopt=shift:2
set cpoptions+=n
set completeopt+=menuone
set completeopt+=noinsert
set noinfercase
set completeopt-=preview
set completeopt+=menuone,noselect

" let Vundle manage Vundle, required
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
" Plugin 'python-mode/python-mode'
" Plugin 'rdnetto/YCM-Generator'
" Plugin 'valloric/youcompleteme'
" Plugin 'VundleVim/Vundle.vim'
" Plugin 'Xuyuanp/nerdtree-git-plugin'
" Plugin 'bling/vim-airline'
" Plugin 'chun-yang/auto-pairs'
" Plugin 'ddollar/nerdcommenter'
" Plugin 'deviantfero/wpgtk.vim'
" Plugin 'honza/vim-snippets'
" Plugin 'kien/ctrlp.vim'
" Plugin 'lambdalisue/suda.vim'
" Plugin 'mattn/emmet-vim'
" Plugin 'neoclide/coc.nvim'
" Plugin 'pangloss/vim-javascript'
" Plugin 'scrooloose/nerdtree'
" Plugin 'scrooloose/syntastic'
" Plugin 'sirver/UltiSnips'
" Plugin 'terryma/vim-multiple-cursors'
" Plugin 'tpope/vim-fugitive'
" Plugin 'tpope/vim-repeat'
" Plugin 'tpope/vim-surround'
" Plugin 'vhdirk/vim-cmake'
" Plugin 'vim-airline/vim-airline-themes'
" Plugin 'zirrostig/vim-schlepp'
" call vundle#end()

filetype plugin indent on

"  commands
command Q q!
command W w suda://%
nmap <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>i
nmap <C-q> :q<CR>
imap <C-q> <Esc>:q<CR>
tnoremap <Esc><Esc> <C-\><C-n>

" colors and symbols
hi ColorColumn ctermfg=0 ctermbg=1
hi Comment ctermfg=14 ctermbg=NONE
hi CursorLineNr ctermfg=15 ctermbg=NONE
hi VertSplit ctermfg=0 ctermbg=8
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" cmake flags
let g:cmake_cxx_compiler='clang++'
let g:cmake_c_compiler='clang'
let g:cmake_ycm_symlinks=1

" Ultisnips config
let g:UltiSnipsExpandTrigger="<C-Space>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"

" Youcompleteme config
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" leader key
let mapleader = "ö"
let maplocalleader = "ä"

" pymodes python
let g:pymode_python='python3'
let g:pymode_doc_bind='<leader>K'
au FileType python setlocal formatprg=autopep8\ -

" other keybindings
map <F8> :setlocal spell!<CR>
nnoremap <leader>f :nohlsearch<CR>
nnoremap <leader>h :nohl<CR>
nnoremap <leader>r_ :%s/_/\ /g<CR>
nnoremap <leader>r. :%s/\./\ /g<CR>
" tab bindings
nnoremap tn :tabnew<Space>
nnoremap tj :tabnext<CR>
nnoremap tk :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

" airline font
let g:airline_powerline_fonts = 1

" Nerdtree bindings and Settings
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
" Nerdtree key
map <C-n> :NERDTreeToggle<CR>
" Nerdtee if no file is specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%* 
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 10
let g:syntastic_error_symbol = ""
let g:syntastic_warning_symbol= ""
let g:syntastic_style_error_symbol = ""
let g:syntastic_style_warning_symbol = ""
nmap <leader>sr :SyntasticReset<CR>
nmap <leader>se :Errors<CR>
nmap <leader>sq :lclose<CR>
nmap <leader>sc :SyntasticCheck<CR>
nmap <leader>sj :lnext<CR>
nmap <leader>sk :lprev<CR>

" multicursor binding

let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-m>'
let g:multi_cursor_select_all_word_key = '<A-m>'
let g:multi_cursor_start_key           = 'g<C-m>'
let g:multi_cursor_select_all_key      = 'g<A-m>'
let g:multi_cursor_next_key            = '<C-m>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" Nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERTCustomDelimiters = { 'tex': { 'left': '% ', 'right': '' } }

" navigation bindings
inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
map <Space><Tab> <Esc>/<++><Enter>"_c4l
noremap j gj
noremap k gk
nmap J 10j
nmap K 10k
nmap H 10h
nmap L 10l
" nnoremap <A-j> J

" split bindings
set splitbelow splitright
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Text manipulation bindings
vmap <A-k> <Plug>SchleppUp
vmap <A-j> <Plug>SchleppDown
vmap <A-h> <Plug>SchleppLeft
vmap <A-l> <Plug>SchleppRight
vmap <A-d> <Plug>SchleppDup

" Compiler script
map <localleader>c :w! \| !compile <c-r>%<CR>

" execute macros over visual selection
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction


" Latex bindings
let g:tex_flavor = "latex"
autocmd FileType tex inoremap ;fig <Esc>:-1r $HOME/.vim/snippets/tex/figure<CR>o
autocmd FileType tex inoremap ;tab <Esc>:-1r $HOME/.vim/snippets/tex/table<CR>$i
autocmd FileType tex inoremap ;a <Esc>:-1r $HOME/.vim/snippets/tex/link<CR>2T{i
autocmd FileType tex inoremap ;ol <Esc>:-1r $HOME/.vim/snippets/tex/ol<CR>jA
autocmd FileType tex inoremap ;ul <Esc>:-1r $HOME/.vim/snippets/tex/ul<CR>jA
autocmd FileType tex inoremap ;chp <Esc>:-1r $HOME/.vim/snippets/tex/chapter<CR>$i
autocmd FileType tex inoremap ;sec \section{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;*sec \section*{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;*ssec \subsection*{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;*sssec \subsubsection*{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex nnoremap ;up /usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex inoremap ;no \noindent
autocmd FileType tex inoremap ;ra {\rightarrow}
autocmd FileType tex inoremap ;la {\leftarrow}
autocmd FileType tex inoremap ;lra {\leftrightarrow}
autocmd FileType tex inoremap ;fa {\forall}
autocmd FileType tex inoremap ;ex {\exists}
autocmd FileType tex inoremap ;pie <Esc>:-1r $HOME/.vim/snippets/tex/piechart_colored<CR><Esc>i
autocmd FileType tex inoremap ;func <Esc>:-1r $HOME/.vim/snippets/tex/functiongraphs<CR><Esc>i

" Bibliography bindings
autocmd FileType bib inoremap ;a <Esc>:-1read $HOME/.vim/snippets/bib/article<CR>$i
autocmd FileType bib inoremap ;b <Esc>:-1read $HOME/.vim/snippets/bib/book<CR>$i
autocmd FileType bib inoremap ;c <Esc>:-1read $HOME/.vim/snippets/bib/incollection<CR>$i
autocmd FileType bib inoremap ;mi <Esc>:-1read $HOME/.vim/snippets/bib/misc<CR>$i
autocmd FileType bib inoremap ;trp <Esc>:-1read $HOME/.vim/snippets/bib/techreport<CR>$i
