local nvim_status = require "lsp-status"
local cmd = vim.cmd

local status = {}
status.capabilities = nvim_status.capabilities

status.activate = function()
  nvim_status.register_progress()
  nvim_status.config {
    status_symbol = "  LSP:",
    indicator_errors = "",
    indicator_warnings = "",
    indicator_info = "כֿ",
    indicator_hint = "➤",
    indicator_ok = "",
    spinner_frames = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" },
  }
end

status.on_attach = function(client)
  nvim_status.on_attach(client)

  cmd [[augroup dev_lsp_status]]
  cmd [[  autocmd CursorHold,BufEnter <buffer> lua require('lsp-status').update_current_function()]]
  cmd [[augroup END]]
end

return status
