require("dressing").setup {
  input = {
    enabled = true,
    default_prompt = "➤ ",
    insert_only = true,
    anchor = "SW",
    relative = "cursor",
    row = 0,
    col = 0,
    border = "rounded",
    prefer_width = 40,
    min_width = 20,
    winblend = 0,
  },
}
