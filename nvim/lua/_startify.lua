local map = require('utils').map
local g = vim.g

map('n', '<leader>~', ':Startify<CR>', {silent = true})

g.startify_lists = {
    { type = "commands", header = {"    Commands"} },
}


g.startify_commands = {
    { "Update Plugins", "PackerUpdate" },
    { "Update Treesitter", "TSUpdate" },
    { "Check", "checkhealth" },
}

g.startify_change_to_dir = 1
