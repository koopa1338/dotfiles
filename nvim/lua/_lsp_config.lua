local nvim_lsp = require('lspconfig')
local map = require('utils').map
local g = vim.g

require('compe').setup {
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = 'enable',
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = true,
    source = {
        path = true,
        buffer = true,
        calc = true,
        nvim_lsp = true,
        nvim_lua = true,
        vsnip = false,
        ultisnips = false,
    }
}

-- Use <Tab> and <S-Tab> to navigate through popup menu, CR for confirm
map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', { expr = true })
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', { expr = true })
map('i', '<CR>', 'compe#confirm("<CR>")', { expr = true })

-- lsp config
local opts = {silent = true}
local custom_attach = function()
    vim.cmd("setlocal omnifunc=v:lua.vim.lsp.omnifunc")
    map('n', '<leader>lD', ':lua vim.lsp.buf.declaration()<CR>', opts)
    map('n', '<leader>ld', ':lua vim.lsp.buf.definition()<CR>', opts)
    map('n', '<leader>li', ':lua vim.lsp.buf.implementation()<CR>', opts)
    map('n', '<leader>lt', ':lua vim.lsp.buf.type_definition()<CR>', opts)
    map('n', '<leader>lr', ':lua vim.lsp.buf.references()<CR>', opts)
    map('n', '<leader>lR', ':lua vim.lsp.buf.rename()<CR>', opts)
    map('n', '<leader>ll', ':lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    map('n', '<leader>lj', ':lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    map('n', '<leader>lk', ':lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    map('n', '<leader>lf', ':lua vim.lsp.buf.formatting_sync(nil, 1000)<CR>', opts)
    map('n', '<leader>ls', ':lua vim.lsp.buf.signature_help()<CR>', opts)
    map('n', '<leader>lC', ':lua vim.lsp.buf.code_action()<CR>', opts)
    map('n', '<leader>lci', ':lua vim.lsp.buf.incoming_calls()<CR>', opts)
    map('n', '<leader>lco', ':lua vim.lsp.buf.outgoing_calls()<CR>', opts)
end

local servers = {
  clangd = {
    filetypes = { "c", "cc", "cpp", "objc", "objcpp" }
  },
  bashls = {},
  vimls = {},
  ocamlls = {
    root_dir = nvim_lsp.util.root_pattern(".merlin", "package.json") or nvim_lsp.util.find_git_root
  },
  yamlls = {},
  tsserver = {
    cmd = { "tsserver" },
    root_dir = nvim_lsp.util.find_git_root or nvim_lsp.util.find_node_modules_root
  },
  jsonls = {
    cmd = { "json-languageserver", "--stdio" }
  },
  jdtls = {
    filetypes = { "java" },
    cmd = { "jdtls" },
    root_dir = nvim_lsp.util.find_git_root
  },
  texlab = {
    cmd = { "texlab" },
  },
  dockerls = {},
  rust_analyzer = {
    root_dir = nvim_lsp.util.root_pattern("Cargo.toml", "rust-project.json") or nvim_lsp.util.find_git_root
  },
  gopls = {},
  jedi_language_server = {
    root_dir = nvim_lsp.util.find_git_root
  },
  html = {},
  sumneko_lua = {
    cmd = { "lua-language-server" },
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
  cssls = {
    cmd = { "css-languageserver", "--stdio" },
  },
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
