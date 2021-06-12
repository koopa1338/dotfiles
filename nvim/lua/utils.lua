local M = {}

-- Key mapping
function M.map(mode, key, result, opts)
    vim.api.nvim_set_keymap(
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

-- zoom function
local zoomed_lua = false
local width
local height
function M.zoom_toggle()
    if zoomed_lua then
        -- change this to a lua call
        vim.api.nvim_win_set_width(0, width)
        vim.api.nvim_win_set_height(0, height)
        zoomed_lua = false
    else
        width = vim.api.nvim_win_get_width(0)
        height = vim.api.nvim_win_get_height(0)
        vim.cmd("resize")
        vim.cmd("vertical resize")
        zoomed_lua = true
    end
end

return M
