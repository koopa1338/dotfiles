local reloader = require "plenary.reload"

-- Key mapping
Map = function(mode, lhs, rhs, opts)
  local opts_or_defaults = {
    remap = opts.remap or false,
    silent = opts.silent or false,
    expr = opts.expr or false,
  }
  if opts.buffer then
    opts_or_defaults["buffer"] = opts.buffer
  end

  vim.keymap.set(mode, lhs, rhs, opts_or_defaults)
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
