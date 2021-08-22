local sign_define = vim.fn.sign_define
local g = vim.g

g.diagnostic_enable_virtual_text = 1
g.diagnostic_enable_underline = 0
g.diagnostic_trimmed_virtual_text = "40"
g.diagnostic_insert_delay = 1

sign_define(
    "LspDiagnosticsSignError",
    {text = "", texthl = "LspDiagnosticsSignError"}
)
sign_define(
    "LspDiagnosticsSignWarning",
    {text = "", texthl = "LspDiagnosticsSignWarning"}
)
sign_define(
    "LspDiagnosticsSignInformation",
    {text = "כֿ", texthl = "LspDiagnosticsSignInformation"}
)
sign_define(
    "LspDiagnosticsSignHint",
    {text = "➤", texthl = "LspDiagnosticsSignHint"}
)
