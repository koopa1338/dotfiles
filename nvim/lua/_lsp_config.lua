local nvim_lsp = require('nvim_lsp')
local completion = require('completion')
local map = require('utils').map
local g = vim.g

local opts = {silent = true}
local custom_attach = function(client)
    vim.cmd("setlocal omnifunc=v:lua.vim.lsp.omnifunc")
    completion.on_attach(client)
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
  bashls = {},
  vimls = {},
  ocamlls = {},
  yamlls = {},
  tsserver = {
    root_dir = nvim_lsp.util.find_git_root or nvim_lsp.util.find_node_modules_root
  },
  jsonls = {},
  jdtls = {
    filetypes = { "java" },
    root_dir = nvim_lsp.util.find_git_root
  },
  dockerls = {},
  rust_analyzer = {
      root_dir = nvim_lsp.util.find_git_root
  },
  gopls = {},
  jedi_language_server = {
    root_dir = nvim_lsp.util.find_git_root
  },
  html = {
    filetypes = {"html", "jinja"}
  },
  sumneko_lua = {
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
          path = vim.split(package.path, ";")
        },
        completion = {
          keywordSnippet = "Disable"
        },
        diagnostics = {
          enable = true,
          globals = {"vim"}
        },
        workspace = {
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
          }
        }
      }
    }
  },
  cssls = {},
}

for server, config in pairs(servers) do
    config.on_attach = custom_attach
    nvim_lsp[server].setup(config)
end

g.indicator_errors = ''
g.indicator_warnings = ''
g.indicator_info = '🛈'
g.indicator_hint = '!'
g.indicator_ok = ''
g.spinner_frames = {'⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷'}
