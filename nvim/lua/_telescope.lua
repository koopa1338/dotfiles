local map = require('utils').map
local actions = require('telescope.actions')
local previewers = require('telescope.previewers')

require('telescope').setup {
  defaults = {
    file_previewer = previewers.vim_buffer_cat.new,
    grep_previewer = previewers.vim_buffer_vimgrep.new,
    qflist_previewer = previewers.vim_buffer_qflist.new,
    layout_strategy = 'horizontal',
    layout_defaults = {
      horizontal = {
        width_padding = 0.1,
        height_padding = 0.1,
        preview_width = 0.6,
      },
      vertical = {
        width_padding = 0.05,
        height_padding = 1,
        preview_height = 0.5,
      }
    },
    mappings = {
      i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
      }
    },
    selection_strategy = "reset",
    sorting_strategy = "descending",
    scroll_strategy = "cycle",
    prompt_position = "top",
  }
}

map("n", "<Leader>fg", ":lua require('telescope.builtin').git_files{}<CR>", {silent = true})
map("n", "<Leader>ff", ":lua require('telescope.builtin').find_files{}<CR>", {silent = true})
map("n", "<Leader>fF", ":lua require('telescope.builtin').find_files({ hidden = true })<CR>", {silent = true})
map("n", "<Leader>fr", ":lua require('telescope.builtin').live_grep{}<CR>", {silent = true})
map("n", "<Leader>bb", ":lua require('telescope.builtin').buffers{}<CR>", {silent = true})
map("n", "<Leader>fb", ":lua require('telescope.builtin').current_buffer_fuzzy_find{}<CR>", {silent = true})
map("n", "<Leader>ft", ":lua require('telescope.builtin').lsp_document_symbols{}<CR>", {silent = true})
map("n", "<Leader>fT", ":lua require('telescope.builtin').lsp_workspace_symbols{}<CR>", {silent = true})
map("n", "<Leader>fs", ":lua require('telescope.builtin').lsp_references{}<CR>", {silent = true})
map("n", "<Leader>fq", ":lua require('telescope.builtin').quickfix{}<CR>", {silent = true})
map("n", "<Leader>fe", ":lua require('telescope.builtin').treesitter{}<CR>", {silent = true})
map("n", "<Leader>fm", ":lua require('telescope.builtin').marks(require('telescope.themes').get_dropdown())<CR>", {silent = true})
