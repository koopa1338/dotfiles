require("nvim-treesitter.configs").setup {
  auto_install = true,
  highlight = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = { -- mappings for incremental selection (visual mappings)
      init_selection = "<M-w>", -- maps in normal mode to init the node/scope selection
      scope_incremental = "<M-w>", -- increment to the upper scope (as defined in locals.scm)
      node_incremental = "<M-n>", -- increment to the upper named parent
      node_decremental = "<M-d>", -- decrement to the previous node
    },
  },
  indent = { enable = true },
  refactor = {
    highlight_definitions = { enable = true },
    highlight_current_scope = { enable = true },
  },
  autotag = {
    enable = true,
  },
}
