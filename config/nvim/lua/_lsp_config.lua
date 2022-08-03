local nvim_lsp = require "lspconfig"
local status = require "_lsp_status"
-- local nvim_status = require "lsp-status"
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
  bo.omnifunc = "v:lua.vim.lsp.omnifunc"
  local capabilities = client.server_capabilities

  if capabilities.declarationProvider then
    map("n", "<leader>lD", ":lua vim.lsp.buf.declaration()<CR>", opts)
  end

  if capabilities.definitionProvider then
    map("n", "<leader>ld", ":lua vim.lsp.buf.definition()<CR>", opts)
  end

  if capabilities.typeDefinitionProvider then
    map("n", "<leader>lT", ":lua vim.lsp.buf.type_definition()<CR>", opts)
  end

  if capabilities.renameProvider then
    map("n", "<leader>lr", ":lua vim.lsp.buf.rename()<CR>", opts)
  end

  if capabilities.documentFormattingProvider then
    map("n", "<leader>lf", ":lua vim.lsp.buf.format({async = true})<CR>", opts)
  end

  if capabilities.signatureHelpProvider then
    map("n", "<leader>ls", ":lua vim.lsp.buf.signature_help()<CR>", opts)
  end

  if capabilities.codeActionProvider then
    map("n", "<leader>lca", ":lua vim.lsp.buf.code_action()<CR>", opts)
    map("v", "<leader>lca", ":lua vim.lsp.buf.range_code_action()<CR>", opts)
  end

  if capabilities.hoverProvider then
    map("n", "K", ":lua vim.lsp.buf.hover()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if capabilities.documentHighlightProvider then
    local lsp_highlight_au = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
    vim.api.nvim_create_autocmd(
      { "CursorHold" },
      { group = lsp_highlight_au, command = "lua vim.lsp.buf.document_highlight()" }
    )
    vim.api.nvim_create_autocmd(
      { "CursorMoved" },
      { group = lsp_highlight_au, command = "lua vim.lsp.buf.clear_references()" }
    )
  end

  if capabilities.codeLensProvider then
    map("n", "<leader>K", ":lua vim.lsp.codelens.run()<CR>", opts)
    local lsp_codelens_au = vim.api.nvim_create_augroup("lsp_document_codelens", { clear = true })
    vim.api.nvim_create_autocmd(
      { "BufEnter" },
      { group = lsp_codelens_au, once = true, command = "lua vim.lsp.codelens.refresh()" }
    )
    vim.api.nvim_create_autocmd(
      { "BufWritePost", "CursorHold" },
      { group = lsp_codelens_au, command = "lua vim.lsp.codelens.refresh()" }
    )
  end

  if capabilities.documentSymbolProvider then
    map("n", "<leader>lts", ":Telescope lsp_document_symbols<CR>", { silent = true })
    status.on_attach(client)
  end

  if capabilities.workspaceSymbolProvider then
    map("n", "<leader>ltS", ":Telescope lsp_workspace_symbols<CR>", { silent = true })
  end

  if capabilities.referencesProvider then
    map("n", "<leader>ltr", ":Telescope lsp_references<CR>", { silent = true })
  end

  if capabilities.implementationProvider then
    map("n", "<leader>lti", ":Telescope lsp_implementations<CR>", { silent = true })
  end

  map("n", "<leader>lci", ":lua vim.lsp.buf.incoming_calls()<CR>", opts)
  map("n", "<leader>lco", ":lua vim.lsp.buf.outgoing_calls()<CR>", opts)
  map("n", "<leader>ll", ":lua vim.diagnostic.open_float({scope='l', source='if_many'})<CR>", opts)
  map("n", "<leader>lj", ":lua vim.diagnostic.get_next()<CR>", opts)
  map("n", "<leader>lk", ":lua vim.diagnostic.get_prev()<CR>", opts)
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
    cmd = { "vscode-css-language-server", "--stdio" },
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
    cmd = { "vscode-html-language-server", "--stdio" },
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

for server, config in pairs(servers) do
  config.on_attach = custom_attach
  -- config.capabilities = updated_capabilities
  nvim_lsp[server].setup(config)
end
