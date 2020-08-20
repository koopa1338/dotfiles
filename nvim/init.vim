" Plugins
call plug#begin('~/.vim/plugged')

" libs
	Plug 'tpope/vim-repeat'

" editing
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-commentary'
	Plug 'svermeulen/vim-subversive'

" movement and search
	Plug 'junegunn/vim-slash'	
	Plug 'markonm/traces.vim'	

" searching and file browsing
    Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
    Plug 'vn-ki/coc-clap'
    Plug 'lambdalisue/fern.vim'
    Plug 'lambdalisue/fern-renderer-nerdfont.vim'
    Plug 'lambdalisue/nerdfont.vim'

" text objects and motions
	Plug 'wellle/targets.vim'
    Plug 'jiangmiao/auto-pairs'
	Plug 'alvan/vim-closetag'
    Plug 'matze/vim-move'

" shell commands extension
	Plug 'tpope/vim-eunuch'

" miscellaneous
    Plug 'SirVer/ultisnips'

" syntax and languages
	Plug 'lervag/vimtex'
	Plug 'ludovicchabant/vim-gutentags'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'liuchengxu/vista.vim'

" Language documentation integration
    Plug 'Shougo/echodoc.vim'

" theme
	Plug 'bling/vim-airline'
	Plug 'deviantfero/wpgtk.vim'
	Plug 'vim-airline/vim-airline-themes'

" version control
	Plug 'junegunn/gv.vim'
	Plug 'tpope/vim-fugitive'
	Plug 'rhysd/git-messenger.vim'

" project management
	Plug 'tpope/vim-projectionist'

call plug#end()

" encoding
set encoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8

" general settings
set nocompatible
filetype plugin indent on
syntax enable
colorscheme wpgtk
let mapleader=" "
set backspace=indent,eol,start
set linespace=0
set showmatch
set whichwrap=b,s,h,l,<,>,[,]
set scrolljump=10
set scrolloff=5
set mouse=a
set mousehide
set modeline
set updatetime=300
set cmdheight=2
set hidden
set confirm
set signcolumn=yes
set path+=**
set undodir=~/.config/nvim/undodir
set undofile

" Figure out the system Python for Neovim.
if exists("$VIRTUAL_ENV")
    let g:python3_host_prog=substitute(system('which -a python3 | head -n2 | tail -n1'), '\n', '', 'g')
    let g:python2_host_prog=substitute(system('which -a python2 | head -n2 | tail -n1'), '\n', '', 'g')
else
    let g:python3_host_prog=substitute(system('which python3'), '\n', '', 'g')
    let g:python2_host_prog=substitute(system('which python2'), '\n', '', 'g')
endif

set clipboard+=unnamedplus
set formatoptions=qrnj1
set noswapfile
set spelllang=de_de,en_us
set nobackup
set nowritebackup
set signcolumn=yes

" line numbers
set rnu
set nu
set ruler
augroup NumberToggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" search
set incsearch
set hlsearch
set ignorecase
set smartcase

" wildmenu
set wildmenu
set wildmode=longest:full,full
set wildoptions=pum
set completeopt+=menuone,noinsert,noselect
set cpoptions+=n
set noinfercase
set shortmess+=c

" formatting
set wrap
set autoindent
set shiftwidth=4
set expandtab
set tabstop=4
set softtabstop=4
set nojoinspaces
set splitright
set splitbelow
set laststatus=2
set comments=sl:/*,mb:*,elx:*/
set linebreak
set breakindent
set breakindentopt=shift:2

" Highlighta settings and maps
if has("autocmd")
    if v:version > 701
        autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
        autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
    endif
endif
map <silent><Esc> :nohl<CR>
map <silent><C-c> <Esc>

" Plugin settings
"
let g:titlecase_map_keys = 0

" Fern nerdfont
let g:fern#renderer = "nerdfont"
nmap <silent><C-n> :Fern . -drawer -width=35 -toggle<CR>

" ultisnips
let g:UltiSnipsExpandTrigger="<c-q>"
let g:UltiSnipsJumpForwardTrigger="<c-v>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" gutentags
let g:gutentags_exclude_filetypes = ['gitcommit', 'gitconfig', 'gitrebase', 'gitsendemail', 'git']
let g:gutentags_ctags_tagfile = '.ctags'

" coc language server
let g:coc_global_extensions = ['coc-css', 'coc-html', 'coc-vimtex',
    \ 'coc-json', 'coc-prettier', 'coc-python', 'coc-stylelint',
    \ 'coc-phpls', 'coc-tslint', 'coc-tsserver', 'coc-yaml',
    \ 'coc-vimlsp', 'coc-xml', 'coc-lists', 'coc-ultisnips',
	\ 'coc-go', 'coc-snippets',  'coc-java', 'coc-bibtex']

let g:coc_snippet_next='<tab>'

" disable netrw
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

" tex falvor
let g:tex_flavor = "latex"

" git-integration
let g:git_messenger_no_default_mappings = 1
let g:git_messenger_always_into_popup = 1
nmap <leader>gm <Plug>(git-messenger)
nmap <leader>gv :GV<CR>
nmap <leader>gV :GV!<CR>
nmap <leader>gs :G<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gj :diffget //3<CR>

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

nnoremap <silent><leader><leader> :call ToggleQuickfix()<CR>
function! ToggleQuickfix()
    for buffer in tabpagebuflist()
        if bufname(buffer) == ''
            cclose
            return
        endif
    endfor
    copen
endfunction

" buffers
nmap <silent> <leader>ba :e#<CR>
nmap <silent> <leader>bd :bdelete<CR>
nmap <silent> <leader>bD :%bdelete<CR>
nmap <silent> <leader>bw :bwipeout<CR>
nmap <silent> <leader>bW :%bwipeout<CR>
nmap <silent> <leader>bo :%bdelete\|edit #\|normal `"<CR>
nmap <silent> <leader>bO :%bwipeout\|edit #\|normal `"<CR>
nmap <silent> <leader>by :normal! ggVGy``<CR>
nmap <silent> <leader>bp :normal! ggdGP<CR>

" windows
nmap <silent> <leader>wo :only<CR>
nmap <silent> <leader>ws :split<CR>
nmap <silent> <leader>wv :vsplit<CR>
nmap <silent> <leader>wc :close<CR>
noremap <C-j> :wincmd j<CR>
noremap <C-k> :wincmd k<CR>
noremap <C-h> :wincmd h<CR>
noremap <C-l> :wincmd l<CR>

function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <Leader>z :ZoomToggle<CR>

nmap <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>i
tnoremap <Esc><Esc> <C-\><C-n>

" movement
noremap j gj
noremap k gk
noremap H ^
noremap L $
nnoremap <TAB> %

" Yank from cursor to end of line
nnoremap Y y$

" Insert newline
nnoremap <leader>o o<ESC>
nnoremap <leader>O O<ESC>j

" Search and replace under cursor or selection
nnoremap <leader>* :%s/\<<C-r><C-w>\>/<Left>
vnoremap <leader>* "hy:%s/\V<C-r>h/<left>
