local nvim_lsp = require "lspconfig"
local status = require "_lsp_status"
local nvim_status = require "lsp-status"
local path = nvim_lsp.util.path
local map = require("utils").map
local fn, bo, env = vim.fn, vim.bo, vim.env

local function get_python_path()
  -- Use activated virtualenv.
  if env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, "bin", "python")
  end

  -- Find and use virtualenv from pipenv in workspace directory.
  -- local match = vim.fn.glob(path.join(workspace, 'Pipfile'))
  -- if match ~= '' then
  --   local venv = vim.fn.trim(vim.fn.system('PIPENV_PIPFILE=' .. match .. ' pipenv --venv'))
  --   return path.join(venv, 'bin', 'python')
  -- end

  -- Fallback to system Python.
  return fn.exepath "python3" or fn.exepath "python" or "python"
end

status.activate()

-- lsp config
local opts = { silent = true }
local custom_attach = function(client)
  status.on_attach(client)
  bo.omnifunc = "v:lua.vim.lsp.omnifunc"
  local capabilities = client.resolved_capabilities

  if capabilities.declaration then
    map("n", "<leader>lD", ":lua vim.lsp.buf.declaration()<CR>", opts)
  end

  if capabilities.goto_definition then
    map("n", "<leader>ld", ":lua vim.lsp.buf.definition()<CR>", opts)
  end

  if capabilities.type_definition then
    map("n", "<leader>lt", ":lua vim.lsp.buf.type_definition()<CR>", opts)
  end

  if capabilities.rename then
    map("n", "<leader>lr", ":lua vim.lsp.buf.rename()<CR>", opts)
  end

  if capabilities.document_formatting then
    map("n", "<leader>lf", ":lua vim.lsp.buf.formatting({})<CR>", opts)
  end

  if capabilities.signature_help then
    map("n", "<leader>ls", ":lua vim.lsp.buf.signature_help()<CR>", opts)
  end

  map("n", "<leader>lci", ":lua vim.lsp.buf.incoming_calls()<CR>", opts)
  map("n", "<leader>lco", ":lua vim.lsp.buf.outgoing_calls()<CR>", opts)
  map("n", "<leader>ll", ":lua vim.diagnostic.open_float({scope='l', source='if_many'})<CR>", opts)
  map("n", "<leader>lj", ":lua vim.diagnostic.get_next()<CR>", opts)
  map("n", "<leader>lk", ":lua vim.diagnostic.get_prev()<CR>", opts)
  map("n", "K", ":lua vim.lsp.buf.hover()<CR>", opts)

  -- Set autocommands conditional on server_capabilities
  if capabilities.document_highlight then
    vim.cmd [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]]
  end

  if capabilities.code_lens then
    vim.cmd [[
      augroup lsp_document_codelens
        au! * <buffer>
        autocmd BufEnter ++once         <buffer> lua require"vim.lsp.codelens".refresh()
        autocmd BufWritePost,CursorHold <buffer> lua require"vim.lsp.codelens".refresh()
      augroup END
    ]]
  end
end

-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local servers = {
  -- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
  bashls = {},
  clangd = {
    filetypes = { "c", "cc", "cpp", "objc", "objcpp" },
  },
  cmake = {},
  cssls = {
    cmd = { "css-languageserver", "--stdio" },
  },
  dockerls = {},
  gopls = {
    cmd = { "gopls", "serve" },
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },
    },
  },
  graphql = {},
  html = {
    cmd = { "html-languageserver", "--stdio" },
    root_dir = nvim_lsp.util.root_pattern "index.html" or nvim_lsp.util.find_git_root,
  },
  jedi_language_server = {
    root_dir = nvim_lsp.util.find_git_root,
    settings = {
      python = {
        pythonPath = get_python_path(),
      },
    },
  },
  jdtls = {
    filetypes = { "java" },
    cmd = { "jdtls" },
    root_dir = nvim_lsp.util.root_pattern("mvnw", "gradlew", "pom.xml", "build.gradle") or nvim_lsp.util.find_git_root,
  },
  jsonls = {
    cmd = { "vscode-json-language-server", "--stdio" },
  },
  ocamlls = {
    root_dir = nvim_lsp.util.root_pattern(".merlin", "package.json") or nvim_lsp.util.find_git_root,
  },
  rust_analyzer = {
    root_dir = nvim_lsp.util.root_pattern("Cargo.toml", "rust-project.json") or nvim_lsp.util.find_git_root,
  },
  sumneko_lua = {
    cmd = { "lua-language-server" },
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
          path = runtime_path,
        },
        completion = {
          keywordSnippet = "Disable",
          showWord = "Disable",
        },
        diagnostics = {
          enable = true,
          globals = { "vim" },
        },
        workspace = {
          library = {
            [fn.expand "$VIMRUNTIME/lua"] = true,
            [fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
          },
        },
      },
    },
  },
  texlab = {
    cmd = { "texlab" },
  },
  tsserver = {
    cmd = { "typescript-language-server", "--stdio" },
    root_dir = nvim_lsp.util.find_git_root or nvim_lsp.util.find_node_modules_root,
  },
  vimls = {},
  yamlls = {},
}

local updated_capabilities = vim.lsp.protocol.make_client_capabilities()
updated_capabilities = vim.tbl_deep_extend("keep", updated_capabilities, nvim_status.capabilities)
updated_capabilities.textDocument.codeLens = { dynamicRegistration = false }
updated_capabilities = require("cmp_nvim_lsp").update_capabilities(updated_capabilities)

for server, config in pairs(servers) do
  config.on_attach = custom_attach
  config.capabilities = updated_capabilities
  nvim_lsp[server].setup(config)
end

-- setting up debugger
require("dapui").setup()
