local map = require("utils").map

map("n", "<F4>", ":lua require'dap'.toggle_breakpoint()<CR>", {silent = true})
map("n", "<F5>", ":lua require'dap'.continue()<CR>", {silent = true})
map("n", "<F9>", ":lua require'dap'.step_over()<CR>", {silent = true})
map("n", "<F10>", ":lua require'dap'.step_into()<CR>", {silent = true})
map("n", "<F11>", ":lua require'dap'.step_out()<CR>", {silent = true})
map("n", "<F12>", ":lua require'dap'.repl.open()<CR>", {silent = true})

local dap, dapui = require"dap", require"dapui"
-- TODO: setup configurations for debug options
-- dap.configuration.rust = {}

-- setting up debugger ui
dapui.setup({
  layouts = {
    {
      elements = {
        { id = "scopes", size = 0.33 },
        { id = "breakpoints", size = 0.33 },
        { id = "stacks", size = 0.33 },
      },
      size = 40,
      position = "left",
    },
    {
      elements = {
        { id = "watches", size = 0.5 },
        { id = "console", size = 0.5 },
      },
      size = 40,
      position = "right",
    },
    {
      elements = {
        "repl",
      },
      size = 0.25,
      position = "bottom",
    }
  }

})

-- open dapui when start debugging
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

