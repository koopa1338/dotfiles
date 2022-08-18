if not pcall(require, "nvim_context_vt") then
  return
end

require("nvim_context_vt").setup {
  prefix = "⟃",
  disable_virtual_lines = true,
}
