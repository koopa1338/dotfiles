local map = require("utils").map

local opts = { silent = true, noremap = false, buffer = true }
map("n", "q", "<cmd>q<CR>", opts)
map("n", "<CR>", "<C-]>", opts)
map("n", "<BS>", "<C-T>", opts)
