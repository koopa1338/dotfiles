local map = require('utils').map
local g = vim.g

g.lua_tree_git_hl = 1
g.lua_tree_indent_markers = 1
g.lua_tree_hide_dotfiles = 1
g.lua_tree_show_icons = {
    git = 0,
    folders = 1,
    files = 1,
}
g.lua_tree_ignore = {'.git', 'node_modules', '.cache'}
g.lua_tree_width = 40

g.lua_tree_bindings = {
    edit = {'<CR>', 'o'},
    edit_vsplit = {'<C-v>'},
    edit_split = {'<C-x>'},
    edit_tab = {'<C-t>'},
    toggle_ignored = {'I'},
    toggle_dotfiles = {'H'},
    refresh = {'R'},
    preview = {'<Tab>'},
    cd = {'.'},
    create = {'a'},
    remove = {'d'},
    rename = {'c'},
    cut = {'x'},
    copy = {'y'},
    paste = {'p'},
    prev_git_item = {'gn'},
    next_git_item = {'gp'},
}

map('n', '<C-n>', "<cmd>LuaTreeToggle<CR>", {
    silent = true
})
