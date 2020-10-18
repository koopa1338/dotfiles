local nvim_lsp = require('nvim_lsp')
local diagnostics = require('diagnostic')
local completion = require('completion')
local map = require('utils').map
local g = vim.g

local opts = {silent = true}
local setup_custom_diagnostics = function()
    vim.lsp.callbacks["textDocument/publishDiagnostics"] = Diagnostic.handle_publish_diagnostics.with {
        should_underline = false,
        update_in_insert = false
    }
    map('n', '<leader>dn', ':lua vim.lsp.structures.Diagnostic.buf_move_next_diagnostic()<CR>', opts)
    map('n', '<leader>dp', ':lua vim.lsp.structures.Diagnostic.buf_move_prev_diagnostic()<CR>', opts)
end

local custom_attach = function()
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    diagnostics.on_attach()
    completion.on_attach()
    map('n', '<leader>lc', ':lua vim.lsp.buf.declaration()<CR>', opts)
    map('n', '<leader>ld', ':lua vim.lsp.buf.definition()<CR>', opts)
    map('n', '<leader>li', ':lua vim.lsp.buf.implementation()<CR>', opts)
    map('n', '<leader>lt', ':lua vim.lsp.buf.type_definition()<CR>', opts)
    map('n', '<leader>lr', ':lua vim.lsp.buf.references()<CR>', opts)
    map('n', '<leader>L', ':lua vim.lsp.buf.code_action()<CR>', opts)
    map('n', '<leader>ln', ':lua vim.lsp.buf.rename()<CR>', opts)
    map('n', '<leader>ll', ':lua vim.lsp.util.show_line_diagnostics()<CR>', opts)
end

local servers = {
    'jedi_language_server',
    'gopls',
    'rust_analyzer',
    'vimls',
    'jsonls',
    'bashls',
    'dockerls'
}
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = custom_attach,
    }
end

g.indicator_errors = ''
g.indicator_warnings = ''
g.indicator_info = '🛈'
g.indicator_hint = '!'
g.indicator_ok = ''
g.spinner_frames = {'⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷'}
