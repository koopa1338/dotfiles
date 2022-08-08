Map("", "<Esc>", ":nohl<CR>", { silent = true, remap = false })
Map("", "<C-c>", "<Esc>", { silent = true, remap = false })

-- buffers
Map("n", "<leader>bd", ":bdelete<CR>", { silent = true, remap = false })
Map("n", "<leader>bD", ":%bdelete<CR>", { silent = true, remap = false })
Map("n", "<leader>BD", ":.+,$bdelete<CR>", { silent = true, remap = false })
Map("n", "<leader>bw", ":bwipeout<CR>", { silent = true, remap = false })
Map("n", "<leader>bW", ":%bwipeout<CR>", { silent = true, remap = false })
Map("n", "<leader>BW", ":.+,$bwipeout<CR>", { silent = true, remap = false })

-- windows
Map("n", "<leader>wo", ":only<CR>", { silent = true, remap = false })
Map("n", "<leader>wsx", ":split<CR>", { silent = true, remap = false })
Map("n", "<leader>wsv", ":vsplit<CR>", { silent = true, remap = false })
Map("n", "<leader>wnx", ":new<CR>", { silent = true, remap = false })
Map("n", "<leader>wnv", ":vnew<CR>", { silent = true, remap = false })
Map("n", "<leader>wq", ":close<CR>", { silent = true, remap = false })
Map("n", "<leader>wt", ":tabclose<CR>", { silent = true, remap = false })
Map("", "<C-j>", ":wincmd j<CR>", { silent = true })
Map("", "<C-k>", ":wincmd k<CR>", { silent = true })
Map("", "<C-h>", ":wincmd h<CR>", { silent = true })
Map("", "<C-l>", ":wincmd l<CR>", { silent = true })
Map("", "<M-j>", ":wincmd +<CR>", { silent = true })
Map("", "<M-k>", ":wincmd -<CR>", { silent = true })
Map("", "<M-h>", ":wincmd <<CR>", { silent = true })
Map("", "<M-l>", ":wincmd ><CR>", { silent = true })
Map("", "<leader><C-j>", ":wincmd J<CR>", { silent = true })
Map("", "<leader><C-k>", ":wincmd K<CR>", { silent = true })
Map("", "<leader><C-h>", ":wincmd H<CR>", { silent = true })
Map("", "<leader><C-l>", ":wincmd L<CR>", { silent = true })

Map("n", "<Leader>z", ":TZFocus<CR>", { silent = true })
Map("n", "<Leader>Z", ":TZAtaraxis<CR>", { silent = true })

Map("n", "<C-s>", ":w<CR>", { remap = false })
Map("i", "<C-s>", "<Esc>:w<CR>", { remap = false })
Map("t", "<Esc><Esc>", "<C-\\><C-n>", {})

-- movement
Map("", "j", "gj", {})
Map("", "k", "gk", {})
Map("", "H", "^", {})
Map("", "L", "$", {})

Map("", "<M-o>", ":cn<CR>", {})
Map("", "<M-i>", ":cp<CR>", {})

-- Yank from cursor to end of line
Map("n", "Y", "y$", {})

-- Reselect visual block after indent
Map("x", "<", "<gv", {})
Map("x", ">", ">gv", {})

-- search for multiple words seperated by |
-- Example /\vtest|live highlights test and live
Map("n", "g/", "/\\v", {})

Map("n", "<leader><leader>m", ":Messages<CR>", { silent = true })
