local map = require('utils').map
local actions = require('telescope.actions')

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
      }
    }
  }
}

map("n", "<Leader>fg", ":lua require('telescope.builtin').git_files{}<CR>", {silent = true})
map("n", "<Leader>ff", ":lua require('telescope.builtin').find_files{}<CR>", {silent = true})
map("n", "<Leader>fr", ":lua require('telescope.builtin').live_grep{}<CR>", {silent = true})
map("n", "<Leader>bb", ":lua require('telescope.builtin').buffers{}<CR>", {silent = true})
map("n", "<Leader>fb", ":lua require('telescope.builtin').current_buffer_fuzzy_find{}<CR>", {silent = true})
map("n", "<Leader>ft", ":lua require('telescope.builtin').lsp_document_symbols{}<CR>", {silent = true})
map("n", "<Leader>fT", ":lua require('telescope.builtin').lsp_workspace_symbols{}<CR>", {silent = true})
map("n", "<Leader>fs", ":lua require('telescope.builtin').lsp_references{}<CR>", {silent = true})
map("n", "<Leader>fq", ":lua require('telescope.builtin').quickfix{}<CR>", {silent = true})
map("n", "<Leader>fe", ":lua require('telescope.builtin').treesitter{}<CR>", {silent = true})
