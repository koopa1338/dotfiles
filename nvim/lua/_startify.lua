local map = require('utils').map
local g = vim.g

g.startify_bookmarks = {
    "~/dotfiles",
    "~/Projects/kawa-rs",
    "~/Projects/mugen",
    "~/Projects/dynrs",
    "~/Projects/rsmenu",

}

g.startify_lists = {
    { type = "bookmarks", header = {"    Bookmarks"} },
    { type = "dir", header = {"    MRU "} },
    { type = "files", header = {"    MRU Files"} },
    { type = "commands", header = {"    Commands"} },
}

map('n', '<leader>~', ':Startify<CR>', {silent = true})
