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
filetype off
set shell=sh

" let Vundle manage Vundle, required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'chun-yang/auto-pairs'
Plugin 'mattn/emmet-vim'
Plugin 'dbeniamine/cheat.sh-vim'
Plugin 'ddollar/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'valloric/youcompleteme'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'honza/vim-snippets'
Plugin 'dylanaraps/wal.vim'
call vundle#end()

filetype plugin indent on

"  commands
command Q q!
command W w !sudo tee % > /dev/null

" colors and symbols
colorscheme wal
hi ColorColumn ctermfg=0 ctermbg=1
hi Comment ctermfg=14 ctermbg=NONE
hi CursorLineNr ctermfg=15 ctermbg=NONE
set fillchars+=vert:
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" line numbers
set rnu
set nu
set ruler

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
set completeopt-=preview

" leader key
let mapleader = "ö"
let maplocalleader = "ä"

" other keybindings
:map <F8> :setlocal spell!<CR>
:nnoremap <leader>h :nohl<CR>
" tab bindings
nnoremap tn :tabnew<Space>
nnoremap tj :tabnext<CR>
nnoremap tk :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

" multi-cursor-mappings
let g:multi_cursor_use_default_mapping = 0

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
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%* 
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
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

" Youcompleteme config
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERTCustomDelimiters = { 'tex': { 'left': '% ', 'right': '' } }

" navigation bindings
inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
map <Space><Tab> <Esc>/<++><Enter>"_c4l

" split bindings
set splitbelow splitright
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Document compile bindings
" TODO: maybe add a compile script for various filetypes
autocmd FileType rmd map <F5> :!echo<Space>"require(rmarkdown);<Space>render('<C-r>%')"<Space>\|<Space>R<Space>--vanilla<Enter>

" Latex bindings
let g:tex_flavor = "latex"
autocmd FileType tex inoremap <F5> <Esc>:w<Enter>:!latexmk -pdf -interaction=nonstopmode <C-r>%<Enter>i
autocmd FileType tex nnoremap <F5> :w<Enter>:!latexmk -pdf -interaction=nonstopmode <C-r>%<Enter>
autocmd FileType tex inoremap ;fig \begin{figure}<nter><Enter>\end{figure}<Esc>2kA
autocmd FileType tex inoremap ;tab \begin{tabular}<Enter><++><Enter>\\end{tabular}<Enter><Enter><Esc>4kA{}<Esc>i
autocmd FileType tex inoremap ;beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Enter><Enter><++><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
autocmd FileType tex inoremap ;a \href{}{<++>}<Space><++><Esc>2T{i
autocmd FileType tex inoremap ;ol \\begin{enumerate}<Enter><Enter>\\end{enumerate}<Enter><Enter><++><Esc>3kA\\item<Space>
autocmd FileType tex inoremap ;ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ;chp \chapter{}<Enter><Enter><++><Esc>2kf}i
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
autocmd FileType tex inoremap ;pie <Esc>:r /home/koopa/latex/templates/piechart_colored.template<Enter><Esc>i
autocmd FileType tex inoremap ;bar <Esc>:r /home/koopa/latex/templates/barchart_basic.template<Enter><Esc>i
autocmd FileType tex inoremap ;func <Esc>:r /home/koopa/latex/templates/functiongraphs.template<Enter><Esc>i

" Bibliography bindings
autocmd FileType bib inoremap ;a @article{<Enter>author<Space>=<Space>{<++>},<Enter>year<Space>=<Space><++>,<Enter>title<Space>=<Space>{{<++>}},<Enter>journal<Space>=<Space>{<++>},<Enter>volume<Space>=<Space>{<++>},<Enter>pages<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>8kA,<Esc>i
autocmd FileType bib inoremap ;b @book{<Enter>author<Space>=<Space>{<++>},<Enter>year<Space>=<Space><++>,<Enter>title<Space>=<Space>{{<++>}},<Enter>publisher<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>6kA,<Esc>i
autocmd FileType bib inoremap ;c @incollection{<Enter>author<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{{<++>}},<Enter>booktitle<Space>=<Space><++>,<Enter>editor<Space>=<Space>{<++>},<Enter>year<Space>=<Space><++>,<Enter>publisher<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>8kA,<Esc>i
autocmd FileType bib inoremap ;mi @misc{<Enter>author<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{{<++>}},<Enter>howpublished<Space>=<Space>{<++>},<Enter>note<Space>=<Space>{<++>},<Enter>day<Space>=<Space><++>,<Enter>month<Space>=<Space><++>,<Enter>year<Space>=<Space><++>,<Enter>}<Enter><++><Esc>9kA,<Esc>i
autocmd FileType bib inoremap ;trp @techreport{<Enter>author<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{{<++>}},<Enter>institution<Space>=<Space>{<++>},<Enter>number<Space>=<Space>{<++>},<Enter>year<Space>=<Space><++><Enter>}<Enter><++><Esc>7kA,<Esc>i
