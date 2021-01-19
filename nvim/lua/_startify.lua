local map = require('utils').map
local g = vim.g

map('n', '<leader>~', ':Startify<CR>', {silent = true})

g.startify_bookmarks = {
    "~/dotfiles",
    "~/Projects/kawa-rs",
    "~/Projects/mugen",
    "~/Projects/dynrs",
    "~/Projects/rsmenu",

}

g.startify_lists = {
    { type = "bookmarks", header = {"    Bookmarks"} },
    { type = "commands", header = {"    Commands"} },
}


g.startify_commands = {
    { "Update Plugins", "PackerUpdate" },
    { "Update Treesitter", "TSUpdate" },
}

g.startify_change_to_dir = 1
