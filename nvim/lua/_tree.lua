local map = require('utils').map
local g = vim.g

local function tree_kb(kb_name)
  return string.format(":lua require'nvim-tree'.on_keypress('%s')<CR>", kb_name)
end

g.nvim_tree_git_hl = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_hide_dotfiles = 1
g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
}
g.nvim_tree_ignore = {'.git', 'node_modules', '.cache'}
g.nvim_tree_width = 40
g.nvim_tree_width_allow_resize = 1

g.nvim_tree_bindings = {
    ["."] = tree_kb('cd'),
    ["c"] = tree_kb('rename'),
    ["y"] = tree_kb('copy'),
    ["gn"] = tree_kb('next_git_item'),
    ["gp"] = tree_kb('prev_git_item'),
}

map('n', '<C-n>', "<cmd>NvimTreeToggle<CR>", {
    silent = true
})
g.nvim_tree_icons = {
    git = {
        unstaged = '☒',
        staged = '☑',
        unmerged = '',
        untracked = '✸'
    }
}
