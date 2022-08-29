local ls = L "luasnip"
if not ls then
  return
end

ls.config.set_config {
  history = true,
  updateevents = "TextChanged,TextChangedI",
}
-- toggle choices of choice nodes
Map("i", "<C-k>", require "luasnip.extras.select_choice", { silent = true })

-- get friendly-snippets to work with LuaSnip
require("luasnip.loaders.from_vscode").lazy_load()

-- unmap these in select mode to change snippet defaults
UnMap("x", "N")
UnMap("x", "n")
UnMap("x", "g#")
UnMap("x", "g*")
UnMap("x", "gD")
UnMap("x", "gd")
