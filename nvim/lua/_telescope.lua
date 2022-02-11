local map = require("utils").map
local actions = require "telescope.actions"
local previewers = require "telescope.previewers"
local telescope = require "telescope"

telescope.setup {
  defaults = {
    file_previewer = previewers.vim_buffer_cat.new,
    grep_previewer = previewers.vim_buffer_vimgrep.new,
    qflist_previewer = previewers.vim_buffer_qflist.new,
    layout_strategy = "flex",
    layout_config = {
      prompt_position = "top",
      horizontal = {
        preview_width = 0.6,
      },
      vertical = {
        preview_height = 0.5,
      },
    },
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<M-q>"] = actions.smart_send_to_qflist,
      },
    },
    selection_strategy = "reset",
    sorting_strategy = "descending",
    scroll_strategy = "cycle",
    prompt_prefix = "🔎  ",
  },
  extensions = {
    project = {
      base_dirs = {
        { "~/Projects", max_depth = 3 },
      },
    },
  },
}

-- loading extensions
telescope.load_extension "project"
telescope.load_extension "fzf"
telescope.load_extension "notify"

map("n", "<leader>fg", ":Telescope git_files theme=get_dropdown<CR>", { silent = true })
map("n", "<leader>ff", ":Telescope fd theme=get_ivy hidden=true<CR>", { silent = true })
map("n", "<leader>FF", ":Telescope fd theme=get_ivy hidden=true no_ignore=true<CR>", { silent = true })
map("n", "<leader>fr", ":Telescope live_grep<CR>", { silent = true })
map("v", "<leader>f*", ":Telescope grep_string<CR>", { silent = true })
map("n", "<leader>f*", ":Telescope grep_string<CR>", { silent = true })
map("n", "<leader>fR", ":Telescope registers<CR>", { silent = true })
map("n", "<leader>bb", ":Telescope buffers theme=get_ivy<CR>", { silent = true })
map("n", "<leader>fb", ":Telescope current_buffer_fuzzy_find previewer=false<CR>", { silent = true })
map("n", "<leader>fe", ":Telescope treesitter<CR>", { silent = true })
map("n", "<leader>fm", ":Telescope marks theme=get_ivy<CR>", { silent = true })
map("n", "<leader>fp", ":Telescope project display_type=full<CR>", { silent = true })

-- lsp bindings
map("n", "<leader>lts", ":Telescope lsp_document_symbols<CR>", { silent = true })
map("n", "<leader>ltS", ":Telescope lsp_workspace_symbols<CR>", { silent = true })
map("n", "<leader>ltc", ":Telescope lsp_code_actions theme=get_cursor<CR>", { silent = true })
map("n", "<leader>ltr", ":Telescope lsp_references<CR>", { silent = true })
map("n", "<leader>ltd", ":Telescope diagnostics bufnr=0<CR>", { silent = true })
map("n", "<leader>ltD", ":Telescope diagnostics<CR>", { silent = true })
map("n", "<leader>lti", ":Telescope lsp_implementations<CR>", { silent = true })

map("n", "<leader><leader>q", ":Telescope quickfix layout_strategy=vertical<CR>", { silent = true })
map("n", "<leader><leader>l", ":Telescope loclist layout_strategy=vertical<CR>", { silent = true })
map("n", "<leader><leader>n", ":Telescope notify theme=get_dropdown<CR>", { silent = true })

map("n", "<leader>tm", ":Telescope man_pages layout_strategy=vertical<CR>", { silent = true })
map("n", "<leader>tk", ":Telescope keymaps<CR>", { silent = true })
