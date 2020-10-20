local M = {}

-- Key mapping
function M.map(mode, key, result, opts)
    vim.fn.nvim_set_keymap(
        mode,
        key,
        result,
        {
            noremap = opts.noremap or true,
            silent = opts.silent or false,
            expr = opts.expr or false,
            script = opts.script or false
        }
    )
end

return M
