local map = require('utils').map
local g = vim.g

-- git
g.git_messenger_no_default_mappings = 1
g.git_messenger_always_into_popup = 1

map("n", "<Leader>gm", "<Plug>(git-messenger)", {silent = true})
map("n", "<Leader>gl", ":GV<CR>", {silent = true})
map("n", "<Leader>gL", ":GV!<CR>", {silent = true})
map("n", "<Leader>gs", ":G<CR>", {silent = true})
map("n", "<Leader>gD", ":Gdiff<CR>", {silent = true})
map("n", "<Leader>gp", ":Git push<CR>", {silent = true})
map("n", "<Leader>gf", ":diffget //2<CR>", {silent = true})
map("n", "<Leader>gj", ":diffget //3<CR>", {silent = true})

-- git signify
g.signify_sign_add = ''
g.signify_sign_delete = ''
g.signify_sign_delete_first_line = 'ﳺ'
g.signify_sign_change = '勒'

map("n", "<Leader>gd", ":SignifyHunkDiff<CR>", {silent = true})
map("n", "<Leader>gu", ":SignifyHunkUndo<CR>", {silent = true})
map("n", "<Leader>gv", ":SignifyToggleHighlight<CR>", {silent = true})
