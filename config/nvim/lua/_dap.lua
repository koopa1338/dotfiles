Map("n", "<F4>", ":lua require'dap'.toggle_breakpoint()<CR>", { silent = true })
Map("n", "<F5>", ":lua require'dap'.continue()<CR>", { silent = true })
Map("n", "<F9>", ":lua require'dap'.step_over()<CR>", { silent = true })
Map("n", "<F10>", ":lua require'dap'.step_into()<CR>", { silent = true })
Map("n", "<F11>", ":lua require'dap'.step_out()<CR>", { silent = true })
Map("n", "<F12>", ":lua require'dap'.repl.open()<CR>", { silent = true })

local dap, dapui = require "dap", require "dapui"
-- TODO: setup configurations for debug options
-- dap.configuration.rust = {}

-- setting up debugger ui
dapui.setup {
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
    },
  },
}

-- open dapui when start debugging
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
  vim.opt.ls = 3
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
  vim.opt.ls = 2
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
  vim.opt.ls = 2
end

dap.adapters.lldb = {
  type = 'executable',
  command = 'lldb-vscode', -- adjust as needed, must be absolute path
  name = 'lldb'
}

dap.configurations.rust = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input({
        prompt = "Target: ",
        default = vim.fn.getcwd() .. "/target/",
        completion = "file_in_path"
      })
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
  },
}
