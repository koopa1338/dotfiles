if not pcall(require, "Comment") then
  return
end

require("Comment").setup {
  mappings = {
    basic = true,
    extra = true,
    extended = true,
  },
}
