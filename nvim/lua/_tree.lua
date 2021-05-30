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
g.nvim_tree_auto_ignore_ft = {'startify'}
g.nvim_tree_width = 40
g.nvim_tree_width_allow_resize = 1
g.nvim_tree_lsp_diagnostics = 1

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
g.nvim_tree_bindings = {
    ["."] = tree_cb('cd'),
    ["c"] = tree_cb('rename'),
    ["y"] = tree_cb('copy'),
    ["gn"] = tree_cb('next_git_item'),
    ["gp"] = tree_cb('prev_git_item'),
}


g.nvim_tree_icons = {
    git = {
        unstaged = '☒',
        staged = '☑',
        unmerged = '',
        untracked = '✸'
    }
}

map('n', '<C-n>', "<cmd>NvimTreeToggle<CR>", { silent = true })
