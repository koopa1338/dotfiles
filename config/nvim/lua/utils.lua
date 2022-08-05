local api = vim.api
local buf_keymap, keymap = api.nvim_buf_set_keymap, api.nvim_set_keymap
local reloader = require("plenary.reload")

-- Key mapping
Map = function(mode, key, result, opts)
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

Contains = function(tab, val)
  for _, value in ipairs(tab) do
    if value == val then
      return true
    end
  end

  return false
end



P = function(arg)
    print(vim.inspect(arg))
    return arg
  end

R = function(name)
  reloader.reload_module(name)
  return require(name)
end
