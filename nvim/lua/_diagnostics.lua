local sign_define = vim.fn.sign_define
local g = vim.g

g.diagnostic_enable_virtual_text = 1
g.diagnostic_enable_underline = 0
g.diagnostic_trimmed_virtual_text = "40"
g.diagnostic_insert_delay = 1

sign_define(
    "LspDiagnosticsErrorSign",
    {text = "", texthl = "LspDiagnosticsError"}
)
sign_define(
    "LspDiagnosticsWarningSign",
    {text = "", texthl = "LspDiagnosticsWarning"}
)
sign_define(
    "LspDiagnosticsInformationSign",
    {text = "כֿ", texthl = "LspDiagnosticsInformation"}
)
sign_define(
    "LspDiagnosticsHintSign",
    {text = "➤", texthl = "LspDiagnosticsHint"}
)
