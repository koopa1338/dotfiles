require"nvim-treesitter.configs".setup {
    highlight = { enable = true },
    incremental_selection = {
        enable = true,
        keymaps = { -- mappings for incremental selection (visual mappings)
            init_selection = '<M-w>',    -- maps in normal mode to init the node/scope selection
            node_incremental = '<M-w>',  -- increment to the upper named parent
            scope_incremental = '<M-e>', -- increment to the upper scope (as defined in locals.scm)
            node_decremental = '<M-C-w>',  -- decrement to the previous node
        }
    },
    indent = { enable = true },
    refactor = {
        highlight_definitions = { ebable = true },
        highlight_current_scope = { ebable = true },
    }
}
