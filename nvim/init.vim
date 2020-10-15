lua require('plugins')
lua require('lsp_config')

" encoding
set encoding=utf-8
set fileencoding=utf-8
scriptencoding=utf-8

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

" More natural splitting
set splitbelow
set splitright

" Figure out the system Python for Neovim.
if exists("$VIRTUAL_ENV")
    let g:python3_host_prog=substitute(system('which -a python3 | head -n2 | tail -n1'), '\n', '', 'g')
    let g:python2_host_prog=substitute(system('which -a python2 | head -n2 | tail -n1'), '\n', '', 'g')
else
    let g:python3_host_prog=substitute(system('which python3'), '\n', '', 'g')
    let g:python2_host_prog=substitute(system('which python2'), '\n', '', 'g')
endif

set clipboard+=unnamedplus
set formatoptions=cqrnj1
set noswapfile
set spelllang=de_de,en_us
set nobackup
set nowritebackup
set signcolumn=yes

" line numbers
set rnu
set nu
set ruler

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

if has('windows')
  set fillchars=vert:┃,eob:￭
endif


" Highlighta settings and maps
if has("autocmd")
    if v:version > 701
        autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
        autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
    endif

    augroup NumberToggle
        autocmd!
        autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
        autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
    augroup END

    autocmd VimResized * wincmd =

    au TextYankPost * silent! lua vim.highlight.on_yank()
endif

map <silent><Esc> :nohl<CR>
map <silent><C-c> <Esc>

" Plugin settings

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

" disable netrw
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

" tex falvor
let g:tex_flavor = "latex"

" git-integration
let g:git_messenger_no_default_mappings = 1
let g:git_messenger_always_into_popup = 1
nmap <leader>gm <Plug>(git-messenger)
nmap <leader>gl :GV<CR>
nmap <leader>gL :GV!<CR>
nmap <leader>gs :G<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gp :Gpush<CR>
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
let g:airline#extensions#tabline#enabled = 1

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
nmap <silent> <leader>bd :bdelete<CR>
nmap <silent> <leader>bD :%bdelete<CR>
nmap <silent> <leader>bw :bwipeout<CR>
nmap <silent> <leader>bW :%bwipeout<CR>

" windows
nmap <silent> <leader>wo :only<CR>
nmap <silent> <leader>ws :split<CR>
nmap <silent> <leader>wns :new<CR>
nmap <silent> <leader>wnv :vnew<CR>
nmap <silent> <leader>wq :close<CR>
noremap <silent><C-j> :wincmd j<CR>
noremap <silent><C-k> :wincmd k<CR>
noremap <silent><C-h> :wincmd h<CR>
noremap <silent><C-l> :wincmd l<CR>
noremap <silent><leader><C-j> :wincmd J<CR>
noremap <silent><leader><C-k> :wincmd K<CR>
noremap <silent><leader><C-h> :wincmd H<CR>
noremap <silent><leader><C-l> :wincmd L<CR>

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

" make tab and shift + tab be useful
nnoremap <tab>   :cn<CR>
nnoremap <S-tab> :cp<CR>

" moving lines also accepts count
nnoremap <leader>k  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap <leader>j :<c-u>execute 'move +'. v:count1<cr>

" Yank from cursor to end of line
nnoremap Y y$

nnoremap <silent> <leader>o :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
nnoremap <silent> <leader>O :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>


" lua require('init')
