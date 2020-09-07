local nvim_lsp = require('nvim_lsp')
local completion = require('completion')
local diagnostics = require('diagnostic')

-- Can set this lower if needed.
-- require('vim.lsp.log').set_level("debug")
-- require('vim.lsp.log').set_level("trace")

local mapper = function(mode, key, result)
    vim.fn.nvim_buf_set_keymap(0, mode, key, result, {noremap = true, silent = true})
end

local setup_custom_diagnostics = function()
    Diagnostic = require('vim.lsp.actions').Diagnostic
    Location = require('vim.lsp.actions').Location

    vim.lsp.callbacks["textDocument/publishDiagnostics"] = Diagnostic.handle_publish_diagnostics.with {
        should_underline = false,
        update_in_insert = false
    }

    mapper(
    'n',
    '<leader>dn',
    '<cmd>lua vim.lsp.structures.Diagnostic.buf_move_next_diagnostic()<CR>'
    )

    mapper(
    'n',
    '<leader>dp',
    '<cmd>lua vim.lsp.structures.Diagnostic.buf_move_prev_diagnostic()<CR>'
    )
end

local custom_attach = function()
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    diagnostics.on_attach()
    completion.on_attach()

    mapper('n', '<leader>lc', '<cmd>lua vim.lsp.buf.declaration()<CR>')
    mapper('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>')
    mapper('n', '<leader>li', '<cmd>lua vim.lsp.buf.implementation()<CR>')
    mapper('n', '<leader>lt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
    mapper('n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<CR>')
    mapper('n', '<leader>L', '<cmd>lua vim.lsp.buf.code_action()<CR>')
    mapper('n', '<leader>ln', '<cmd>lua vim.lsp.buf.rename()<CR>')

    mapper('n', '<leader>ll', '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')

    mapper('n', '<leader>gd',
    '<cmd>lua vim.lsp.buf.definition { callbacks = { Location.jump_first, Location.highlight.with { timeout = 300 } } }<CR>'
    )

    mapper('n', '<leader>pd',
    '<cmd>lua vim.lsp.buf.definition { callbacks = Location.preview.with { lines_below = 5 } }<CR>'
    )
end

local servers = {'gopls', 'rust_analyzer', 'vimls', 'jsonls', 'bashls', 'dockerls'}
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

