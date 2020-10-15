vim.cmd('packadd nvim-lspconfig')
vim.cmd('packadd diagnostic-nvim')
vim.cmd('packadd completion-nvim')
local nvim_lsp = require('nvim_lsp')
local diagnostics = require('diagnostic')
local completion = require('completion')

-- Can set this lower if needed.
-- require('vim.lsp.log').set_level("debug")
-- require('vim.lsp.log').set_level("trace")

local mapper = function(mode, key, result)
    vim.fn.nvim_buf_set_keymap(0, mode, key, result, {noremap = true, silent = true})
end


local setup_custom_diagnostics = function()
    vim.lsp.callbacks["textDocument/publishDiagnostics"] = Diagnostic.handle_publish_diagnostics.with {
        should_underline = false,
        update_in_insert = false
    }

    mapper(
    'n',
    '<leader>dn',
    ':lua vim.lsp.structures.Diagnostic.buf_move_next_diagnostic()<CR>'
    )

    mapper(
    'n',
    '<leader>dp',
    ':lua vim.lsp.structures.Diagnostic.buf_move_prev_diagnostic()<CR>'
    )
end

local custom_attach = function()
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    diagnostics.on_attach()
    completion.on_attach()

    mapper('n', '<leader>lc', ':lua vim.lsp.buf.declaration()<CR>')
    mapper('n', '<leader>ld', ':lua vim.lsp.buf.definition()<CR>')
    mapper('n', '<leader>li', ':lua vim.lsp.buf.implementation()<CR>')
    mapper('n', '<leader>lt', ':lua vim.lsp.buf.type_definition()<CR>')
    mapper('n', '<leader>lr', ':lua vim.lsp.buf.references()<CR>')
    mapper('n', '<leader>L', ':lua vim.lsp.buf.code_action()<CR>')
    mapper('n', '<leader>ln', ':lua vim.lsp.buf.rename()<CR>')

    mapper('n', '<leader>ll', ':lua vim.lsp.util.show_line_diagnostics()<CR>')

end

local servers = {'jedi_language_server', 'gopls', 'rust_analyzer', 'vimls', 'jsonls', 'bashls', 'dockerls'}
  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
      on_attach = custom_attach,
    }
  end

vim.g.indicator_errors = ''
vim.g.indicator_warnings = ''
vim.g.indicator_info = '🛈'
vim.g.indicator_hint = '!'
vim.g.indicator_ok = ''
vim.g.spinner_frames = {'⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷'}

--[[
Example settings, have not messed around with too many of these.
-- require 'nvim_lsp'.pyls_ms.setup{
--     init_options = {
--         interpreter = {
--             properties = {
--                 InterpreterPath = "~/.pyenv/versions/sourceress/bin/python",
--                 Version = "3.6"
--             }
--         }
--     }
-- }
let settings = {
\   "pyls" : {
\     "enable" : v:true,
\     "trace" : { "server" : "verbose", },
\     "commandPath" : "",
\     "configurationSources" : [ "pycodestyle" ],
\     "plugins" : {
\       "jedi_completion" : { "enabled" : v:true, },
\       "jedi_hover" : { "enabled" : v:true, },
\       "jedi_references" : { "enabled" : v:true, },
\       "jedi_signature_help" : { "enabled" : v:true, },
\       "jedi_symbols" : {
\         "enabled" : v:true,
\         "all_scopes" : v:true,
\       },
\       "mccabe" : {
\         "enabled" : v:true,
\         "threshold" : 15,
\       },
\       "preload" : { "enabled" : v:true, },
\       "pycodestyle" : { "enabled" : v:true, },
\       "pydocstyle" : {
\         "enabled" : v:false,
\         "match" : "(?!test_).*\\.py",
\         "matchDir" : "[^\\.].*",
\       },
\       "pyflakes" : { "enabled" : v:true, },
\       "rope_completion" : { "enabled" : v:true, },
\       "yapf" : { "enabled" : v:true, },
\     }}}
--]]

