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
      hidden_files = true,
    },
    ["ui-select"] = {
      require("telescope.themes").get_cursor {},

      -- pseudo code / specification for writing custom displays, like the one
      -- for "codeactions"
      -- specific_opts = {
      --   [kind] = {
      --     make_indexed = function(items) -> indexed_items, width,
      --     make_displayer = function(widths) -> displayer
      --     make_display = function(displayer) -> function(e)
      --     make_ordinal = function(e) -> string
      --   },
      --   -- for example to disable the custom builtin "codeactions" display
      --      do the following
      --   codeactions = false,
      -- }
    },
  },
}

-- loading extensions
telescope.load_extension "project"
telescope.load_extension "fzf"
telescope.load_extension "notify"
telescope.load_extension "ui-select"

Map("n", "<leader>fg", ":Telescope git_files theme=get_ivy<CR>", { silent = true })
Map("n", "<leader>ff", ":Telescope fd theme=get_ivy hidden=true<CR>", { silent = true })
Map("n", "<leader>FF", ":Telescope fd theme=get_ivy hidden=true no_ignore=true<CR>", { silent = true })
Map("n", "<leader>fr", ":Telescope live_grep<CR>", { silent = true })
Map("v", "<leader>f*", ":Telescope grep_string<CR>", { silent = true })
Map("n", "<leader>f*", ":Telescope grep_string<CR>", { silent = true })
Map("n", "<leader>fR", ":Telescope registers theme=get_ivy<CR>", { silent = true })
Map("n", "<leader>bb", ":Telescope buffers theme=get_ivy<CR>", { silent = true })
Map("n", "<leader>fb", ":Telescope current_buffer_fuzzy_find previewer=false<CR>", { silent = true })
Map("n", "<leader>fe", ":Telescope treesitter<CR>", { silent = true })
Map("n", "<leader>fm", ":Telescope marks theme=get_ivy<CR>", { silent = true })
Map("n", "<leader>fp", ":Telescope project display_type=full<CR>", { silent = true })

-- lsp bindings
Map("n", "<leader>ltd", ":Telescope diagnostics bufnr=0<CR>", { silent = true })
Map("n", "<leader>ltD", ":Telescope diagnostics<CR>", { silent = true })

Map("n", "<leader><leader>q", ":Telescope quickfix layout_strategy=vertical<CR>", { silent = true })
Map("n", "<leader><leader>l", ":Telescope loclist layout_strategy=vertical<CR>", { silent = true })
Map("n", "<leader><leader>n", ":Telescope notify layout_strategy=vertical<CR>", { silent = true })
Map("n", "<leader><leader>N", require("notify").dismiss, { silent = true })

Map("n", "<leader>tm", ":Telescope man_pages layout_strategy=vertical<CR>", { silent = true })
Map("n", "<leader>tk", ":Telescope keymaps<CR>", { silent = true })