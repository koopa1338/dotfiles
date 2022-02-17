local nvim_status = require "lsp-status"
local cmd = vim.cmd

local status = {}

status.select_symbol = function(cursor_pos, symbol)
  if symbol.valueRange then
    local value_range = {
      ["start"] = {
        character = 0,
        line = vim.fn.byte2line(symbol.valueRange[1]),
      },
      ["end"] = {
        character = 0,
        line = vim.fn.byte2line(symbol.valueRange[2]),
      },
    }

    return require("lsp-status.util").in_range(cursor_pos, value_range)
  end
end

status.capabilities = nvim_status.capabilities

status.activate = function()
  nvim_status.config {
    select_symbol = status.select_symbol,
    status_symbol = "  LSP:",

    indicator_errors = "",
    indicator_warnings = "",
    indicator_info = "כֿ",
    indicator_hint = "➤",
    indicator_ok = "",
    spinner_frames = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" },
  }

  nvim_status.register_progress()
end

status.on_attach = function(client)
  nvim_status.on_attach(client)

  cmd [[augroup dev_lsp_status]]
  cmd [[  autocmd CursorHold,BufEnter <buffer> lua require('lsp-status').update_current_function()]]
  cmd [[augroup END]]
end

return status
