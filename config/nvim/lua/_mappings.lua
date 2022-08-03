local map = require("utils").map

map("", "<Esc>", ":nohl<CR>", { silent = true, noremap = false })
map("", "<C-c>", "<Esc>", { silent = true, noremap = false })

-- buffers
map("n", "<leader>bd", ":bdelete<CR>", { silent = true, noremap = false })
map("n", "<leader>bD", ":%bdelete<CR>", { silent = true, noremap = false })
map("n", "<leader>BD", ":.+,$bdelete<CR>", { silent = true, noremap = false })
map("n", "<leader>bw", ":bwipeout<CR>", { silent = true, noremap = false })
map("n", "<leader>bW", ":%bwipeout<CR>", { silent = true, noremap = false })
map("n", "<leader>BW", ":.+,$bwipeout<CR>", { silent = true, noremap = false })

-- windows
map("n", "<leader>wo", ":only<CR>", { silent = true, noremap = false })
map("n", "<leader>wsx", ":split<CR>", { silent = true, noremap = false })
map("n", "<leader>wsv", ":vsplit<CR>", { silent = true, noremap = false })
map("n", "<leader>wnx", ":new<CR>", { silent = true, noremap = false })
map("n", "<leader>wnv", ":vnew<CR>", { silent = true, noremap = false })
map("n", "<leader>wq", ":close<CR>", { silent = true, noremap = false })
map("n", "<leader>wt", ":tabclose<CR>", { silent = true, noremap = false })
map("", "<C-j>", ":wincmd j<CR>", { silent = true })
map("", "<C-k>", ":wincmd k<CR>", { silent = true })
map("", "<C-h>", ":wincmd h<CR>", { silent = true })
map("", "<C-l>", ":wincmd l<CR>", { silent = true })
map("", "<M-j>", ":wincmd +<CR>", { silent = true })
map("", "<M-k>", ":wincmd -<CR>", { silent = true })
map("", "<M-h>", ":wincmd <<CR>", { silent = true })
map("", "<M-l>", ":wincmd ><CR>", { silent = true })
map("", "<leader><C-j>", ":wincmd J<CR>", { silent = true })
map("", "<leader><C-k>", ":wincmd K<CR>", { silent = true })
map("", "<leader><C-h>", ":wincmd H<CR>", { silent = true })
map("", "<leader><C-l>", ":wincmd L<CR>", { silent = true })

map("n", "<Leader>z", ":TZFocus<CR>", { silent = true })
map("n", "<Leader>Z", ":TZAtaraxis<CR>", { silent = true })

map("n", "<C-s>", ":w<CR>", { noremap = false })
map("i", "<C-s>", "<Esc>:w<CR>", { noremap = false })
map("t", "<Esc><Esc>", "<C-\\><C-n>", {})

-- movement
map("", "j", "gj", {})
map("", "k", "gk", {})
map("", "H", "^", {})
map("", "L", "$", {})

map("", "<M-o>", ":cn<CR>", {})
map("", "<M-i>", ":cp<CR>", {})

-- Yank from cursor to end of line
map("n", "Y", "y$", {})

map("n", "<leader>o", ':<C-u>call append(line("."),   repeat([""], v:count1))<CR>', { silent = true })
map("n", "<leader>O", ':<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>', { silent = true })

-- Reselect visual block after indent
map("x", "<", "<gv", {})
map("x", ">", ">gv", {})

-- search for multiple words seperated by |
-- Example /\vtest|live highlights test and live
map("n", "g/", "/\\v", {})

map("n", "<leader><leader>m", ":Messages<CR>", { silent = true })
