require("dressing").setup {
  input = {
    enabled = true,
    default_prompt = "➤ ",
    insert_only = false,
    anchor = "SW",
    relative = "cursor",
    border = "rounded",
    prefer_width = 40,
    min_width = 20,
    winblend = 0,
    override = function(conf)
      conf.row = 4
      return conf
    end,
  },
}
