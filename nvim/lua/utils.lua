local api, cmd = vim.api, vim.cmd
local M = {}

local buf_keymap, keymap = api.nvim_buf_set_keymap, api.nvim_set_keymap
local set_width, get_width = api.nvim_win_set_width, api.nvim_win_get_width
local set_height, get_height = api.nvim_win_set_height, api.nvim_win_get_height

-- Key mapping
function M.map(mode, key, result, opts)
    local opts_or_defaults = {
        noremap = opts.noremap or true,
        silent = opts.silent or false,
        expr = opts.expr or false,
        script = opts.script or false
    }

    if opts.buffer then
        buf_keymap(0, mode, key, result, opts_or_defaults)
    else
        keymap(mode, key, result, opts_or_defaults)
    end
end

-- zoom function
local zoomed_lua = false
local width
local height
function M.zoom_toggle()
    if zoomed_lua then
        -- change this to a lua call
        set_width(0, width)
        set_height(0, height)
        zoomed_lua = false
    else
        width = get_width(0)
        height = get_height(0)
        cmd("resize")
        cmd("vertical resize")
        zoomed_lua = true
    end
end

return M
