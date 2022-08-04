local utils = require "utils"
local api, bo, wo = vim.api, vim.bo, vim.wo

local numbertoggle = api.nvim_create_augroup("NumberToggle", { clear = true })
local blacklist = { "DiffviewFiles", "NvimTree", "DressingInput", "notify" }

api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave" }, {
  group = numbertoggle,
  callback = function()
    local ft = bo.filetype
    if not utils.has_value(blacklist, ft) then
      wo.rnu = true
    end
    if ft == "notify" then
      wo.wrap = true
    end
  end,
})

api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter" }, {
  group = numbertoggle,
  callback = function()
    local ft = bo.filetype
    if not utils.has_value(blacklist, ft) then
      wo.rnu = false
    end
    if ft == "notify" then
      wo.wrap = false
    end
  end,
})

api.nvim_create_autocmd({ "VimResized" }, {
  command = "wincmd =",
})

api.nvim_create_autocmd({ "TextYankPost" }, {
  pattern = { "*" },
  callback = function()
    vim.highlight.on_yank { higroup = "Substitute", timeout = 200, on_macro = true }
  end,
})


local filetypes = api.nvim_create_augroup("FileTypes", { clear = true })

api.nvim_create_autocmd({ "FileType" }, {
  group = filetypes,
  pattern = blacklist,
  callback = function()
    wo.rnu = false
    wo.nu = false
  end,
})

api.nvim_create_autocmd({ "FileType" }, {
  group = filetypes,
  pattern = { "help" },
  callback = function()
    local opts = { silent = true, noremap = false, buffer = true }
    utils.map("n", "<CR>", "<C-]>", opts)
    utils.map("n", "<BS>", "<C-T>", opts)
    vim.cmd "wincmd L"
  end,
})

api.nvim_create_autocmd({ "FileType" }, {
  group = filetypes,
  pattern = { "qf" },
  callback = function()
    bo.buflisted = false
  end,
})

api.nvim_create_autocmd({ "FileType" }, {
  group = filetypes,
  pattern = { "qf", "help", "lspinfo", "notify" },
  callback = function()
    local opts = { silent = true, noremap = false, buffer = true }
    utils.map("n", "q", "<cmd>q<CR>", opts)
  end,
})

api.nvim_create_autocmd({ "FileType" }, {
  group = filetypes,
  pattern = { "lua" },
  callback = function()
    vim.opt.shiftwidth = 2
  end,
})
