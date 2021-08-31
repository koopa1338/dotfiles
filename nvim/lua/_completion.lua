local luasnip = require('luasnip')
local map = require('utils').map


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
        nvim_lsp = true,
        luasnip = true,
        buffer = false,
        calc = false,
        nvim_lua = false,
        vsnip = false,
        ultisnips = false,
    }
}

-- get friendly-snippets to work with LuaSnip
require("luasnip/loaders/from_vscode").lazy_load()

-- Utility functions for compe and luasnip
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col '.' - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' then
    return true
  else
    return false
  end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder

_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t '<C-n>'
  elseif luasnip.expand_or_jumpable() then
    return t '<cmd>lua require("luasnip").expand_or_jump()<CR>'
  elseif check_back_space() then
    return t '<Tab>'
  else
    return vim.fn['compe#complete']()
  end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t '<C-p>'
  elseif luasnip.jumpable(-1) then
    return t '<cmd>lua require("luasnip").jump(-1)<CR>'
  else
    return t '<S-Tab>'
  end
end

_G.esc_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t '<cmd>lua require("compe")._close()<CR>'
  else
    return t '<Esc>'
  end
end

-- Map tab to the above tab complete functiones
map('i', '<Tab>', 'v:lua.tab_complete()', { expr = true })
map('s', '<Tab>', 'v:lua.tab_complete()', { expr = true })
map('i', '<S-Tab>', 'v:lua.s_tab_complete()', { expr = true })
map('s', '<S-Tab>', 'v:lua.s_tab_complete()', { expr = true })
map('i', '<Esc>', 'v:lua.esc_complete()', { expr = true })
map('s', '<Esc>', 'v:lua.esc_complete()', { expr = true })

-- Map compe confirm and complete functions
map('i', '<cr>', 'compe#confirm("<cr>")', { expr = true })
map('i', '<c-space>', 'compe#complete()', { expr = true })
