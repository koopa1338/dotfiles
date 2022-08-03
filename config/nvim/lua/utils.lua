local api = vim.api
local M = {}

local buf_keymap, keymap = api.nvim_buf_set_keymap, api.nvim_set_keymap

-- Key mapping
function M.map(mode, key, result, opts)
  local opts_or_defaults = {
    noremap = opts.noremap or true,
    silent = opts.silent or false,
    expr = opts.expr or false,
    script = opts.script or false,
  }

  if opts.buffer then
    buf_keymap(0, mode, key, result, opts_or_defaults)
  else
    keymap(mode, key, result, opts_or_defaults)
  end
end

function M.has_value(tab, val)
  for _, value in ipairs(tab) do
    if value == val then
      return true
    end
  end

  return false
end

return M
