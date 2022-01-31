local map = require("utils").map
local g, cmd = vim.g, vim.cmd

-- git
g.git_messenger_no_default_mappings = 1
g.git_messenger_always_into_popup = 1

map("n", "<Leader>gm", "<Plug>(git-messenger)", { silent = true })
map("n", "<Leader>gl", ":Gclog<CR>", { silent = true })
map("n", "<Leader>gL", ":GV<CR>", { silent = true })
map("n", "<Leader>gs", ":G<CR>", { silent = true })
map("n", "<Leader>gD", ":Gdiff<CR>", { silent = true })
map("n", "<Leader>gp", ":Git push<CR>", { silent = true })
map("n", "<Leader>gP", ":Git push --force-with-lease<CR>", { silent = true })
map("n", "<Leader>gf", ":diffget //2<CR>", { silent = true })
map("n", "<Leader>gj", ":diffget //3<CR>", { silent = true })

-- git signs
require("gitsigns").setup {
  signs = {
    add = { hl = "GitSignsAdd", text = "", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
    change = { hl = "GitSignsChange", text = "勒", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    delete = { hl = "GitSignsDelete", text = "🢑", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    topdelete = { hl = "GitSignsDelete", text = "🢓", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    changedelete = {
      hl = "GitSignsChange",
      text = "ﳺ",
      numhl = "GitSignsChangeNr",
      linehl = "GitSignsChangeLn",
    },
  },
  numhl = true,
  linehl = false,
  keymaps = {
    -- Default keymap options
    noremap = true,
    buffer = true,
  },
  watch_gitdir = {
    interval = 1000,
  },
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
    delay = 350,
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  diff_opts = {
    internal = true, -- If luajit is present
  },
}

map("n", "<leader>gB", ":lua require('gitsigns').blame_line()<CR>", { silent = true })
map("n", "<leader>gb", ":lua require('gitsigns').toggle_current_line_blame()<CR>", { silent = true })
map("n", "<leader>gd", ":lua require('gitsigns').preview_hunk()<CR>", { silent = true })
map("n", "<leader>g-", ":lua require('gitsigns').undo_stage_hunk()<CR>", { silent = true })
map("n", "<leader>g+", ":lua require('gitsigns').stage_hunk()<CR>", { silent = true })
map("n", "<leader>gu", ":lua require('gitsigns').reset_hunk()<CR>", { silent = true })

cmd [[
    command! Diffwin windo diffthis
]]

local cb = require("diffview.config").diffview_callback

require("diffview").setup {
  diff_binaries = false, -- Show diffs for binaries
  enhanced_diff_hl = false, -- See ':h diffview-config-enhanced_diff_hl'
  use_icons = true, -- Requires nvim-web-devicons
  icons = { -- Only applies when use_icons is true.
    folder_closed = "",
    folder_open = "",
  },
  signs = {
    fold_closed = "",
    fold_open = "",
  },
  file_panel = {
    position = "left", -- One of 'left', 'right', 'top', 'bottom'
    width = 35, -- Only applies when position is 'left' or 'right'
    height = 10, -- Only applies when position is 'top' or 'bottom'
    listing_style = "tree", -- One of 'list' or 'tree'
    tree_options = { -- Only applies when listing_style is 'tree'
      flatten_dirs = true, -- Flatten dirs that only contain one single dir
      folder_statuses = "only_folded", -- One of 'never', 'only_folded' or 'always'.
    },
  },
  file_history_panel = {
    position = "bottom",
    width = 35,
    height = 16,
    log_options = {
      max_count = 256, -- Limit the number of commits
      follow = false, -- Follow renames (only for single file)
      all = false, -- Include all refs under 'refs/' including HEAD
      merges = false, -- List only merge commits
      no_merges = false, -- List no merge commits
      reverse = false, -- List commits in reverse order
    },
  },
  default_args = { -- Default args prepended to the arg-list for the listed commands
    DiffviewOpen = {},
    DiffviewFileHistory = {},
  },
  hooks = {}, -- See ':h diffview-config-hooks'
  key_bindings = {
    disable_defaults = false, -- Disable the default key bindings
    -- The `view` bindings are active in the diff buffers, only when the current
    -- tabpage is a Diffview.
    view = {
      ["<tab>"] = cb "select_next_entry", -- Open the diff for the next file
      ["<s-tab>"] = cb "select_prev_entry", -- Open the diff for the previous file
      ["gf"] = cb "goto_file", -- Open the file in a new split in previous tabpage
      ["<C-w><C-f>"] = cb "goto_file_split", -- Open the file in a new split
      ["<C-w>gf"] = cb "goto_file_tab", -- Open the file in a new tabpage
      ["<leader>e"] = cb "focus_files", -- Bring focus to the files panel
      ["<leader>b"] = cb "toggle_files", -- Toggle the files panel.
    },
    file_panel = {
      ["j"] = cb "next_entry", -- Bring the cursor to the next file entry
      ["<down>"] = cb "next_entry",
      ["k"] = cb "prev_entry", -- Bring the cursor to the previous file entry.
      ["<up>"] = cb "prev_entry",
      ["<cr>"] = cb "select_entry", -- Open the diff for the selected entry.
      ["o"] = cb "select_entry",
      ["<2-LeftMouse>"] = cb "select_entry",
      ["-"] = cb "toggle_stage_entry", -- Stage / unstage the selected entry.
      ["S"] = cb "stage_all", -- Stage all entries.
      ["U"] = cb "unstage_all", -- Unstage all entries.
      ["X"] = cb "restore_entry", -- Restore entry to the state on the left side.
      ["R"] = cb "refresh_files", -- Update stats and entries in the file list.
      ["<tab>"] = cb "select_next_entry",
      ["<s-tab>"] = cb "select_prev_entry",
      ["gf"] = cb "goto_file",
      ["<C-w><C-f>"] = cb "goto_file_split",
      ["<C-w>gf"] = cb "goto_file_tab",
      ["i"] = cb "listing_style", -- Toggle between 'list' and 'tree' views
      ["f"] = cb "toggle_flatten_dirs", -- Flatten empty subdirectories in tree listing style.
      ["<leader>e"] = cb "focus_files",
      ["<leader>b"] = cb "toggle_files",
    },
    file_history_panel = {
      ["g!"] = cb "options", -- Open the option panel
      ["<C-A-d>"] = cb "open_in_diffview", -- Open the entry under the cursor in a diffview
      ["y"] = cb "copy_hash", -- Copy the commit hash of the entry under the cursor
      ["zR"] = cb "open_all_folds",
      ["zM"] = cb "close_all_folds",
      ["j"] = cb "next_entry",
      ["<down>"] = cb "next_entry",
      ["k"] = cb "prev_entry",
      ["<up>"] = cb "prev_entry",
      ["<cr>"] = cb "select_entry",
      ["o"] = cb "select_entry",
      ["<2-LeftMouse>"] = cb "select_entry",
      ["<tab>"] = cb "select_next_entry",
      ["<s-tab>"] = cb "select_prev_entry",
      ["gf"] = cb "goto_file",
      ["<C-w><C-f>"] = cb "goto_file_split",
      ["<C-w>gf"] = cb "goto_file_tab",
      ["<leader>e"] = cb "focus_files",
      ["<leader>b"] = cb "toggle_files",
    },
    option_panel = {
      ["<tab>"] = cb "select",
      ["q"] = cb "close",
    },
  },
}

local neogit = require "neogit"

neogit.setup {
  disable_signs = false,
  disable_hint = false,
  disable_context_highlighting = false,
  disable_commit_confirmation = false,
  auto_refresh = true,
  disable_builtin_notifications = false,
  use_magit_keybindings = false,
  commit_popup = {
    kind = "vsplit",
  },
  -- Change the default way of opening neogit
  kind = "tab",
  -- customize displayed signs
  signs = {
    -- { CLOSED, OPENED }
    section = { "", "" },
    item = { "", "" },
    hunk = { "", "" },
  },
  integrations = {
    diffview = true,
  },
  -- Setting any section to `false` will make the section not render at all
  sections = {
    untracked = {
      folded = false,
    },
    unstaged = {
      folded = false,
    },
    staged = {
      folded = false,
    },
    stashes = {
      folded = true,
    },
    unpulled = {
      folded = true,
    },
    unmerged = {
      folded = false,
    },
    recent = {
      folded = true,
    },
  },
  -- override/add mappings
  mappings = {
    -- modify status buffer mappings
    status = {
      -- Adds a mapping with "B" as key that does the "BranchPopup" command
      ["B"] = "BranchPopup",
    },
  },
}
