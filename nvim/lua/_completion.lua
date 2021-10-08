local cmp = require("cmp")
local luasnip = require('luasnip')

local cmp_kinds = {
    Text          = '',
    Method        = '',
    Function      = '',
    Constructor   = '',
    Field         = 'ﰠ',
    Variable      = '',
    Class         = '',
    Interface     = '',
    Module        = '',
    Property      = '',
    Unit          = '',
    Value         = '',
    Enum          = '',
    Keyword       = '',
    Snippet       = '﬌',
    Color         = '',
    File          = '',
    Reference     = '',
    Folder        = '',
    EnumMember    = '',
    Constant      = '',
    Struct        = '',
    Event         = '',
    Operator      = 'ﬦ',
    TypeParameter = '',
}


cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    sources = {
        { name = "buffer" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
    },
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = (cmp_kinds[vim_item.kind] .. '  ' .. vim_item.kind) or ""
            vim_item.menu = ({
            buffer = "[Buffer]",
            path = "[Path]",
            nvim_lsp = "[LSP]",
            luasnip = "[LuaSnip]",
        })[entry.source.name]
        return vim_item
    end,
    },
    mapping = {
        ["<C-c>"] = cmp.mapping.close(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<cr>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    }
})

-- get friendly-snippets to work with LuaSnip
require("luasnip/loaders/from_vscode").lazy_load()
