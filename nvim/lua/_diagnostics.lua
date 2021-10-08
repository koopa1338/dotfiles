local sign_define = vim.fn.sign_define
local g = vim.g

g.diagnostic_enable_virtual_text = 1
g.diagnostic_enable_underline = 0
g.diagnostic_trimmed_virtual_text = "40"
g.diagnostic_insert_delay = 1

sign_define(
    "DiagnosticSignError",
    {text = "", texthl = "DiagnosticSignError"}
)
sign_define(
    "DiagnosticSignWarn",
    {text = "", texthl = "DiagnosticSignWarn"}
)
sign_define(
    "DiagnosticSignInfo",
    {text = "כֿ", texthl = "DiagnosticSignInfo"}
)
sign_define(
    "DiagnosticSignHint",
    {text = "➤", texthl = "DiagnosticSignHint"}
)
