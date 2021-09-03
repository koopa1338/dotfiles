local nvim_lsp = require('lspconfig')
local status = require("_lsp_status")
local nvim_status = require('lsp-status')
local path = nvim_lsp.util.path
local map = require('utils').map

local function get_python_path()
    -- Use activated virtualenv.
    if vim.env.VIRTUAL_ENV then
        return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
    end

    -- Find and use virtualenv from pipenv in workspace directory.
    -- local match = vim.fn.glob(path.join(workspace, 'Pipfile'))
    -- if match ~= '' then
    --   local venv = vim.fn.trim(vim.fn.system('PIPENV_PIPFILE=' .. match .. ' pipenv --venv'))
    --   return path.join(venv, 'bin', 'python')
    -- end

    -- Fallback to system Python.
    return vim.fn.exepath('python3') or vim.fn.exepath('python') or 'python'
end

status.activate()

-- lsp config
local opts = {silent = true}
local custom_attach = function(client)

    nvim_status.on_attach(client)
    vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

    if client.resolved_capabilities.declaration then
        map('n', '<leader>lD', ':lua vim.lsp.buf.declaration()<CR>', opts)
    end

    if client.resolved_capabilities.goto_definition then
        map('n', '<leader>ld', ':lua vim.lsp.buf.definition()<CR>', opts)
    end

    if client.resolved_capabilities.type_definition then
        map('n', '<leader>lt', ':lua vim.lsp.buf.type_definition()<CR>', opts)
    end

    if client.resolved_capabilities.rename then
        map('n', '<leader>lr', ':lua vim.lsp.buf.rename()<CR>', opts)
    end

    if client.resolved_capabilities.document_formatting then
        map('n', '<leader>lf', ':lua vim.lsp.buf.formatting({})<CR>', opts)
    end

    if client.resolved_capabilities.signature_help then
        map('n', '<leader>ls', ':lua vim.lsp.buf.signature_help()<CR>', opts)
    end

    map('n', '<leader>lci', ':lua vim.lsp.buf.incoming_calls()<CR>', opts)
    map('n', '<leader>lco', ':lua vim.lsp.buf.outgoing_calls()<CR>', opts)
    map('n', '<leader>ll', ':lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    map('n', '<leader>lj', ':lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    map('n', '<leader>lk', ':lua vim.lsp.diagnostic.goto_prev()<CR>', opts)

end

-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

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
    gopls = {
        cmd = {"gopls", "serve"},
        settings = {
            gopls = {
                analyses = {
                    unusedparams = true,
                },
                staticcheck = true,
            },
        }
    },
    jedi_language_server = {
        root_dir = nvim_lsp.util.find_git_root,
        settings = {
            python = {
                pythonPath = get_python_path()
            }
        }
    },
    html = {
        cmd = {"html-languageserver", "--stdio"},
    },
    sumneko_lua = {
        cmd = { "lua-language-server" },
        settings = {
            Lua = {
                runtime = {
                    version = "LuaJIT",
                    path = runtime_path
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

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

for server, config in pairs(servers) do
    config.on_attach = custom_attach
    config.capabilities = capabilities
    nvim_lsp[server].setup(config)
end

vim.lsp.protocol.CompletionItemKind = {
    " [text]",
    " [method]",
    " [function]",
    " [constructor]",
    "ﰠ [field]",
    " [variable]",
    " [class]",
    " [interface]",
    " [module]",
    " [property]",
    " [unit]",
    " [value]",
    " [enum]",
    " [key]",
    " [color]",
    " [file]",
    " [reference]",
    " [folder]",
    " [enum member]",
    " [constant]",
    " [struct]",
    "⌘ [event]",
    " [operator]",
    " [type]"
}
