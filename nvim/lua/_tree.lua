local map = require('utils').map
local g = vim.g

g.nvim_tree_git_hl = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_hide_dotfiles = 1
g.nvim_tree_show_icons = {
    git = 0,
    folders = 1,
    files = 1,
}
g.nvim_tree_ignore = {'.git', 'node_modules', '.cache'}
g.nvim_tree_width = 40
g.nvim_tree_width_allow_resize = 1

g.nvim_tree_bindings = {
    ["."] = ":lua require'nvim-tree'.on_keypress('cd')<CR>",
    ["c"] = ":lua require'nvim-tree'.on_keypress('rename')<CR>",
    ["y"] = ":lua require'nvim-tree'.on_keypress('copy')<CR>",
    ["gn"] = ":lua require'nvim-tree'.on_keypress('next_git_item')<CR>",
    ["gp"] = ":lua require'nvim-tree'.on_keypress('prev_git_item')<CR>",
}

map('n', '<C-n>', "<cmd>NvimTreeToggle<CR>", {
    silent = true
})
