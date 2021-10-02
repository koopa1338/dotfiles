local map = require('utils').map
local g = vim.g

g.nvim_tree_git_hl = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_hide_dotfiles = 1
g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
}
g.nvim_tree_ignore = {'.git', 'node_modules', '.cache'}
g.nvim_tree_icons = {
    git = {
        unstaged = '☒',
        staged = '☑',
        unmerged = '',
        untracked = '✸'
    }
}

map('n', '<C-n>', "<cmd>NvimTreeToggle<CR>", { silent = true })

local tree_cb = require('nvim-tree.config').nvim_tree_callback
local tree = require('nvim-tree')
tree.setup({
    disable_netrw       = true,
    open_on_setup       = false,
    ignore_ft_on_setup  = {'startify'},
    update_to_buf_dir   = {
        enable = true,
        auto_open = true,
    },
    auto_close          = true,
    open_on_tab         = false,
    hijack_cursor       = false,
    update_cwd          = true,
    lsp_diagnostics     = true,
    update_focused_file = {
        enable      = false,
        update_cwd  = false,
        ignore_list = {}
    },
    system_open = {
        cmd  = nil,
        args = {}
    },
    view = {
        width = 40,
        auto_resize = true,
        mappings = {
            custom_only = false,
            list = {
                { key = { "." }, cb = tree_cb('cd') },
                { key = { "c" }, cb = tree_cb('rename') },
                { key = { "y" }, cb = tree_cb('copy') },
                { key = { "gn" }, cb = tree_cb("next_git_item") },
                { key = { "gp" }, cb = tree_cb("prev_git_item") },
            }
        }
    }
})
