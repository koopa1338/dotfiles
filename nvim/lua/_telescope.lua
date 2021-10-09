local map = require('utils').map
local actions = require('telescope.actions')
local previewers = require('telescope.previewers')

require('telescope').setup {
    defaults = {
        file_previewer = previewers.vim_buffer_cat.new,
        grep_previewer = previewers.vim_buffer_vimgrep.new,
        qflist_previewer = previewers.vim_buffer_qflist.new,
        layout_strategy = 'flex',
        layout_config = {
            prompt_position = "top",
            horizontal = {
                preview_width = 0.6,
            },
            vertical = {
                preview_height = 0.5,
            }
        },
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<M-q>"] = actions.smart_send_to_qflist,
            }
        },
        selection_strategy = "reset",
        sorting_strategy = "descending",
        scroll_strategy = "cycle",
        prompt_prefix = "🔎  ",
    },
    extensions = {
        project = {
            base_dirs = {
                { '~/Projects', max_depth = 3 }
            }
        }
    }
}

-- loading extensions
require('telescope').load_extension('project')
require('telescope').load_extension('fzf')

map("n", "<leader>fg", ":lua require('telescope.builtin').git_files(require('telescope.themes').get_dropdown())<CR>", {silent = true})
map("n", "<leader>ff", ":lua require('telescope.builtin').fd(require('telescope.themes').get_ivy())<CR>", {silent = true})
map("n", "<leader>fF", ":lua require('telescope.builtin').fd(require('telescope.themes').get_ivy({ hidden = true, no_ignore = true }))<CR>", {silent = true})
map("n", "<leader>FF", ":lua require('telescope.builtin').file_browser({ hidden = true })<CR>", {silent = true})
map("n", "<leader>fr", ":lua require('telescope.builtin').live_grep{}<CR>", {silent = true})
map("v", "<leader>fr", ":lua require('telescope.builtin').grep_string{}<CR>", {silent = true})
map("n", "<leader>fR", ":lua require('telescope.builtin').registers{}<CR>", {silent = true})
map("n", "<leader>bb", ":lua require('telescope.builtin').buffers(require('telescope.themes').get_ivy())<CR>", {silent = true})
map("n", "<leader>fb", ":lua require('telescope.builtin').current_buffer_fuzzy_find({previewer = false})<CR>", {silent = true})
map("n", "<leader>fe", ":lua require('telescope.builtin').treesitter{}<CR>", {silent = true})
map("n", "<leader>fm", ":lua require('telescope.builtin').marks(require('telescope.themes').get_ivy())<CR>", {silent = true})
map("n", "<leader>fp", ":lua require('telescope').extensions.project.project{ display_type = 'full' }<CR>", {silent = true})

-- lsp bindings
map("n", "<leader>lts", ":lua require('telescope.builtin').lsp_document_symbols{}<CR>", {silent = true})
map("n", "<leader>ltS", ":lua require('telescope.builtin').lsp_workspace_symbols{}<CR>", {silent = true})
map('n', '<leader>ltc', ":lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_cursor())<CR>", {silent = true})
map("n", "<leader>ltr", ":lua require('telescope.builtin').lsp_references{}<CR>", {silent = true})
map("n", "<leader>ltd", ":lua require('telescope.builtin').lsp_document_diagnostics{}<CR>", {silent = true})
map("n", "<leader>ltD", ":lua require('telescope.builtin').lsp_workspace_diagnostics{}<CR>", {silent = true})
map("n", "<leader>lti", ":lua require('telescope.builtin').lsp_implementations{}<CR>", {silent = true})

map("n", "<leader><leader>q", ":lua require('telescope.builtin').quickfix({layout_strategy = 'vertical'})<CR>", {silent = true})
map("n", "<leader><leader>l", ":lua require('telescope.builtin').loclist({layout_strategy = 'vertical'})<CR>", {silent = true})

map("n", "<leader>tm", ":lua require('telescope.builtin').man_pages({layout_strategy = 'vertical'})<CR>", {silent = true})
map("n", "<leader>tk", ":lua require('telescope.builtin').keymaps()<CR>", {silent = true})
