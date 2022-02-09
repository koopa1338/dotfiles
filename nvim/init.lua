require "impatient"
require "plugins"
require "packer_compiled"

local g, v, cmd, fn, o, og = vim.g, vim.v, vim.cmd, vim.fn, vim.opt, vim.opt_global

g.did_load_filetypes = 1

-- encoding
og.encoding = "utf-8"
og.fileencoding = "utf-8"

-- general settings
cmd [[
    filetype plugin indent on
    syntax enable

    command! -range=% Jsonfmt <line1>,<line2>!jql .
]]

-- globals
g.mapleader = " "
g.mousehide = true
og.termguicolors = true

o.timeout = false
o.ttimeout = false
o.backspace = { "indent", "eol", "start" }
o.showmatch = true
o.whichwrap = "b,s,h,l,<,>,<,>"
o.scrolljump = 10
o.scrolloff = 5
o.mouse = "a"
o.modeline = true
o.updatetime = 100
o.cmdheight = 2
o.hidden = true
o.confirm = true
o.signcolumn = "yes"
o.path = o.path + "**"
o.undodir = fn.expand "~/.config/nvim/undodir"
o.undofile = true
o.inccommand = "split"

-- More natural splitting
o.splitbelow = true
o.splitright = true

o.clipboard = "unnamedplus"
o.formatoptions = o.formatoptions
  - "a" -- Auto formatting is BAD.
  - "t" -- Don't auto format my code. I got linters for that.
  + "c" -- In general, I like it when comments respect textwidth
  + "q" -- Allow formatting comments w/ gq
  - "o" -- O and o, don't continue comments
  + "r" -- But do continue when pressing enter.
  + "n" -- Indent past the formatlistpat, not underneath it.
  + "j" -- Auto-remove comments if possible.
  - "2" -- I'm not in gradeschool anymore
o.swapfile = false
o.spelllang = { "de_de", "en_us" }
o.backup = false
o.writebackup = false

-- line numbers
o.rnu = true
o.nu = true
o.ruler = true

-- search
o.incsearch = true
o.hlsearch = true
o.ignorecase = true
o.smartcase = true

-- wildmenu
o.wildmenu = true
o.wildmode = { "longest:full", "full" }
o.wildoptions = "pum"
o.completeopt = { "menuone", "noinsert", "noselect" }
o.cpoptions = o.cpoptions + "n"
o.infercase = false
o.shortmess = o.shortmess + "c"

-- formatting
o.wrap = true
o.autoindent = true
o.shiftwidth = 4
o.expandtab = true
o.tabstop = 4
o.softtabstop = 4
o.joinspaces = false
o.splitright = true
o.splitbelow = true
o.laststatus = 2
o.comments = "sl:/*,mb:*,elx:*/"
o.linebreak = true
o.breakindent = true
o.breakindentopt = "shift:2"

-- Plugin settings

g.titlecase_map_keys = 0

-- disable netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- tex falvor
g.tex_flavor = "latex"

-- luasnip
g.snippets = "luasnip"

if v.version > 701 then
  cmd [[
        autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
        autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\|REVIEW\)')
    ]]
end

if fn.has "windows" then
  o.fillchars = "vert:┃,eob:￭"
end

cmd [[
    augroup NumberToggle
        let blacklist = ['DiffviewFiles', 'NvimTree']
        autocmd!
        autocmd BufEnter,FocusGained,InsertLeave * if index(blacklist, &ft) < 0 | set relativenumber
        autocmd BufLeave,FocusLost,InsertEnter * if index(blacklist, &ft) < 0 | set norelativenumber
    augroup END

    autocmd VimResized * wincmd =

    autocmd TextYankPost * silent! lua vim.highlight.on_yank({ higroup = Substitute, timeout = 200, on_macro = true})

    autocmd FileType help wincmd L
    autocmd FileType fugitive wincmd H
    autocmd FileType qf set nobuflisted
]]

-- TODO: port to lua
cmd [[
    function! ExecuteMacroOverVisualRange()
        echo "@".getcmdline()
        execute ":'<,'>normal @".nr2char(getchar())
    endfunction
]]

require "_zen"
require "_mappings"
require "_lsp_config"
require "_lsp_status"
require "_diagnostics"
require "_treesitter"
require "_telescope"
require "_express_line"
require "_tree"
require "_startify"
require "_git"
require "_completion"
require "_walush"
require "_context"
