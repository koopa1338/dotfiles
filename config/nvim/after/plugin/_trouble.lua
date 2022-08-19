if not pcall(require, "trouble") then
  return
end

require("trouble").setup {
  auto_preview = false,
  auto_fold = true,
  auto_close = true,
  use_diagnostic_signs = true,
}
