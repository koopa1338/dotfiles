local nvim_lsp = require "lspconfig"
local path = nvim_lsp.util.path
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

-- lsp config
local opts = { silent = true }
local custom_attach = function(client)
  bo.omnifunc = "v:lua.vim.lsp.omnifunc"
  local capabilities = client.server_capabilities

  if capabilities.declarationProvider then
    Map("n", "<leader>lD", vim.lsp.buf.declaration, opts)
  end

  if capabilities.definitionProvider then
    Map("n", "<leader>ld", vim.lsp.buf.definition, opts)
  end

  if capabilities.typeDefinitionProvider then
    Map("n", "<leader>lT", vim.lsp.buf.type_definition, opts)
  end

  if capabilities.renameProvider then
    Map("n", "<leader>lr", vim.lsp.buf.rename, opts)
  end

  if capabilities.documentFormattingProvider then
    Map("n", "<leader>lf", function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end

  if capabilities.signatureHelpProvider then
    Map("n", "<leader>ls", vim.lsp.buf.signature_help, opts)
  end

  if capabilities.codeActionProvider then
    Map("n", "<leader>lca", vim.lsp.buf.code_action, opts)
    Map("v", "<leader>lca", vim.lsp.buf.range_code_action, opts)
  end

  if capabilities.hoverProvider then
    Map("n", "K", vim.lsp.buf.hover, opts)
  end

  -- Set autocommands conditional on server_capabilities
  if capabilities.documentHighlightProvider then
    local lsp_highlight_au = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
    vim.api.nvim_create_autocmd(
      { "CursorHold" },
      { group = lsp_highlight_au, callback = vim.lsp.buf.document_highlight }
    )
    vim.api.nvim_create_autocmd(
      { "CursorMoved" },
      { group = lsp_highlight_au, callback = vim.lsp.buf.clear_references }
    )
  end

  -- if capabilities.codeLensProvider then
  --   Map("n", "<leader>K", vim.lsp.codelens.run, opts)
  --   local lsp_codelens_au = vim.api.nvim_create_augroup("lsp_document_codelens", { clear = true })
  --   vim.api.nvim_create_autocmd(
  --     { "BufEnter" },
  --     { group = lsp_codelens_au, once = true, callback = vim.lsp.codelens.refresh }
  --   )
  --   vim.api.nvim_create_autocmd(
  --     { "BufWritePost", "CursorHold" },
  --     { group = lsp_codelens_au, callback = vim.lsp.codelens.refresh }
  --   )
  -- end

  if capabilities.documentSymbolProvider then
    Map("n", "<leader>lts", ":Telescope lsp_document_symbols<CR>", { silent = true })
  end

  if capabilities.workspaceSymbolProvider then
    Map("n", "<leader>ltS", ":Telescope lsp_workspace_symbols<CR>", { silent = true })
  end

  if capabilities.referencesProvider then
    Map("n", "<leader>ltr", ":Telescope lsp_references<CR>", { silent = true })
  end

  if capabilities.implementationProvider then
    Map("n", "<leader>lti", ":Telescope lsp_implementations<CR>", { silent = true })
  end

  Map("n", "<leader>lci", vim.lsp.buf.incoming_calls, opts)
  Map("n", "<leader>lco", vim.lsp.buf.outgoing_calls, opts)
  Map("n", "<leader>ll", function()
    vim.diagnostic.open_float { scope = "l", source = "if_many" }
  end, opts)
  Map("n", "<leader>lj", vim.diagnostic.get_next, opts)
  Map("n", "<leader>lk", vim.diagnostic.get_prev, opts)
end

-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local servers = {
  -- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
  ansiblels = {},
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
  jdtls = {
    filetypes = { "java" },
    cmd = { "jdtls" },
    root_dir = nvim_lsp.util.root_pattern("mvnw", "gradlew", "pom.xml", "build.gradle") or nvim_lsp.util.find_git_root,
  },
  jedi_language_server = {
    root_dir = nvim_lsp.util.find_git_root,
    settings = {
      python = {
        pythonPath = get_python_path(),
      },
    },
  },
  jsonls = {
    cmd = { "vscode-json-language-server", "--stdio" },
  },
  kotlin_language_server = {},
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
  svelte = {},
  tailwindcss = {},
  texlab = {
    cmd = { "texlab" },
  },
  tsserver = {
    cmd = { "typescript-language-server", "--stdio" },
    root_dir = nvim_lsp.util.find_git_root or nvim_lsp.util.find_node_modules_root,
  },
  vimls = {},
  vuels = {},
  wgsl_analyzer = {},
  yamlls = {},
  zls = {},
}

for server, config in pairs(servers) do
  config.on_attach = custom_attach
  -- config.capabilities = updated_capabilities
  nvim_lsp[server].setup(config)
end