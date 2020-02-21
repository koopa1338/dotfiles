" basic settings
filetype off
set clipboard+=unnamedplus
set cmdheight=2
set encoding=utf-8
set formatoptions=qrnj1
set mps+=<:>
set nocompatible
set noswapfile
set scrolljump=15
set shell=fish
set spelllang=de
set mouse=a
syntax enable
set nobackup
set nowritebackup
set updatetime=300
set signcolumn=yes

" search
set hlsearch
set ignorecase
set incsearch
set smartcase

" line numbers
set rnu
set nu
set ruler

" wildmenu
set completeopt+=menuone,noinsert,noselect
set cpoptions+=n
set noinfercase
set shortmess+=c
set wildmenu
set wildoptions=pum

" linebreaks
set shiftwidth=4
set tabstop=4
set laststatus=2
set linebreak
set wrap
set breakindent
set breakindentopt=shift:2

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'bling/vim-airline'
Plug 'chun-yang/auto-pairs'
Plug 'ddollar/nerdcommenter'
Plug 'deviantfero/wpgtk.vim'
Plug 'honza/vim-snippets'
Plug 'lervag/vimtex'
Plug 'lambdalisue/suda.vim'
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'rhysd/vim-clang-format'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vhdirk/vim-cmake'
Plug 'vim-airline/vim-airline-themes'
Plug 'zirrostig/vim-schlepp'
Plug 'mileszs/ack.vim'
call plug#end()

filetype plugin indent on
colorscheme wpgtk

" Keybindings
" leader key
let mapleader = "ö"
let maplocalleader = "ä"

nmap <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>i
nmap <C-q> :q<CR>
imap <C-q> <Esc>:q<CR>
tnoremap <Esc><Esc> <C-\><C-n>
map <F8> :setlocal spell!<CR>
nnoremap <leader>h :nohl<CR>
nnoremap <leader>r_ :%s/_/\ /g<CR>
nnoremap <leader>r. :%s/\./\ /g<CR>

" tab bindings
nnoremap tn :tabnew<Space>
nnoremap tj :tabnext<CR>
nnoremap tk :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

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

" split bindings
set splitbelow splitright
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <leader>< <C-w>5<
nmap <leader>> <C-w>5>


" Pluginsettings

" Nerdtree
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
map <C-n> :NERDTreeToggle<CR>

" Searchplugins
nnoremap <C-p> :FZF<CR>
if executable('rg')
	let g:ackprg = '/usr/bin/rg --vimgrep'
	nnoremap <leader>g :Ack!<Space>
endif

" Schlepp
vmap <A-k> <Plug>SchleppUp
vmap <A-j> <Plug>SchleppDown
vmap <A-h> <Plug>SchleppLeft
vmap <A-l> <Plug>SchleppRight
vmap <A-d> <Plug>SchleppDup

" multicursor binding
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<C-m>'
let g:multi_cursor_select_all_word_key = '<A-m>'
let g:multi_cursor_start_key           = 'g<C-m>'
let g:multi_cursor_select_all_key      = 'g<A-m>'
let g:multi_cursor_next_key            = '<C-m>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

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
" Syntastic keybindings
nmap <leader>sr :SyntasticReset<CR>
nmap <leader>se :Errors<CR>
nmap <leader>sq :lclose<CR>
nmap <leader>sc :SyntasticCheck<CR>
nmap <leader>sj :lnext<CR>
nmap <leader>sk :lprev<CR>

" Nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDCustomDelimiters = { 'tex': { 'left': '% ', 'right': '' } }

" coc language server
let g:coc_global_extensions = ['coc-css', 'coc-html', 'coc-vimtex',
    \ 'coc-json', 'coc-prettier', 'coc-python', 'coc-stylelint',
    \ 'coc-phpls', 'coc-tslint', 'coc-tsserver', 'coc-yaml',
    \ 'coc-vimlsp', 'coc-xml', 'coc-ultisnips', 'coc-lists',
	\ 'coc-go', 'coc-snippets', 'coc-rls', 'coc-java', 'coc-bibtex']

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Use K to show documentation in preview window
nnoremap <silent> <leader> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>f :Prettier<cr>
nmap <leader>f :Prettier<cr>

" Custom Settings

" Compiler script
map <localleader>c :w! \| !compile <c-r>%<CR>

" execute macros over visual selection
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
	echo "@".getcmdline()
	execute ":'<,'>normal @".nr2char(getchar())
endfunction

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_powerline_fonts = 1

" cmake flags
let g:cmake_cxx_compiler='clang++'
let g:cmake_c_compiler='clang'

" make workflow
nnoremap <leader>m :let &makeprg=""<left>
nnoremap <silent><leader>b :cclose<CR>:silent !clear<CR>:make<CR>

nnoremap <leader><leader> :call ToggleQuickfix()<CR>
function! ToggleQuickfix()
	for buffer in tabpagebuflist()
		if bufname(buffer) == ''
			cclose
			return
		endif
	endfor

	copen
endfunction
