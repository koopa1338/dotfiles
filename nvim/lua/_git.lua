local map = require('utils').map
local g = vim.g

-- git
g.git_messenger_no_default_mappings = 1
g.git_messenger_always_into_popup = 1

map("n", "<Leader>gm", "<Plug>(git-messenger)", {silent = true})
map("n", "<Leader>gl", ":Gclog<CR>", {silent = true})
map("n", "<Leader>gL", ":GV<CR>", {silent = true})
map("n", "<Leader>gs", ":G<CR>", {silent = true})
map("n", "<Leader>gD", ":Gdiff<CR>", {silent = true})
map("n", "<Leader>gp", ":Git push<CR>", {silent = true})
map("n", "<Leader>gP", ":Git push --force-with-lease<CR>", {silent = true})
map("n", "<Leader>gf", ":diffget //2<CR>", {silent = true})
map("n", "<Leader>gj", ":diffget //3<CR>", {silent = true})

-- git signs
require('gitsigns').setup {
    signs = {
        add          = {hl = 'GitSignsAdd'   , text = '', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
        change       = {hl = 'GitSignsChange', text = '勒', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
        delete       = {hl = 'GitSignsDelete', text = '🢑', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        topdelete    = {hl = 'GitSignsDelete', text = '🢓', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        changedelete = {hl = 'GitSignsChange', text = 'ﳺ', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    },
    numhl = true,
    linehl = false,
    keymaps = {
        -- Default keymap options
        noremap = true,
        buffer = true,

    },
    watch_index = {
        interval = 1000
    },
    current_line_blame = true,
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 350,
    },
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    diff_opts = {
        internal = true,  -- If luajit is present
    },
}

map("n", "<leader>gB", ":lua require('gitsigns').blame_line()<CR>", {silent = true})
map("n", "<leader>gb", ":lua require('gitsigns').toggle_current_line_blame()<CR>", {silent = true})
map("n", "<leader>gd", ":lua require('gitsigns').preview_hunk()<CR>", {silent = true})
map("n", "<leader>g-", ":lua require('gitsigns').undo_stage_hunk()<CR>", {silent = true})
map("n", "<leader>g+", ":lua require('gitsigns').stage_hunk()<CR>", {silent = true})
map("n", "<leader>gu", ":lua require('gitsigns').reset_hunk()<CR>", {silent = true})


vim.cmd [[
    command! Diffwin windo diffthis
]]
