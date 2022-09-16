L("which-key", function(wk)
  wk.register({
    b = {
      name = "+buffers",
      ["*"] = { "Grep String" },
      d = { "Delete Current Buffer" },
      D = { "Delete All Buffers" },
      w = { "Wipeout Current Buffer" },
      W = { "Wipeout All Buffers" },
    },
    f = {
      name = "+finder",
      ["*"] = { "Grep String" },
      b = { "Fuzzy Find Current Buffer" },
      f = { "Find Files" },
      g = { "Git Files" },
      r = { "Live Grep" },
    },
    w = {
      name = "+windows",
      ["*"] = { "Grep String" },
      q = { "Close Window" },
      t = { "Close Tab" },
      o = { "Close All Other Windows" },
      n = {
        name = "+new",
        x = { "New Horizontal" },
        v = { "New Vertical" },
      },
      s = {
        name = "+split",
        x = { "Split Horizontal" },
        v = { "Split Vertical" },
      },
      f = { "Find Files" },
      g = { "Git Files" },
      r = { "Live Grep" },
    },
    Y = { "Yank Till End" },
    z = { "Focus Time" },
    Z = { "Focus Time++" },
    ["<C-s>"] = { "Save File" },
  }, { prefix = "<leader>" })
end)
