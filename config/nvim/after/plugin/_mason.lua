if not pcall(require, "mason") then
  return
end

require("mason").setup {
  ui = {
    border = "rounded",
    icons = {
      package_installed = "",
      package_pending = "➤",
      package_uninstalled = "",
    },
  },
}
