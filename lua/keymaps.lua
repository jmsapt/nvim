-- local builtin = require('telescope.builtin')
local map = vim.keymap.set
local set = vim.opt
local wk = require("which-key")

-- Prefixes
-- c => current buffer
-- g => global
-- w => window
-- q => quit

wk.register({
  -- Current buffer
  ["<leader>c"] = {
    name = "+current buffer",
    f = { "<cmd>Format<cr>", "Format current buffer" },
    -- todo add toggle inlay support i = {}
  },
  -- Global
  ["<leader>g"] = {
    name = "+global",
  },
  -- Tabs
  ["<leader>g"] = {
    name = "+tabs",
  },
  -- Quitting
  ["<leader>q"] = {
    name = "+quit",
    q = { ":wa<cr>:qa<cr>", "Quit all buffers (write first)" },
    Q = { ":qa!<cr>", "Force quit all buffers" },
  },
  -- Window
  ["<leader>w"] = {
    name = "+window",
  },
  -- Neotree
  ["<leader>e"] = { "<cmd>Neotree focus<cr>", "Neotree" },
  -- Insert newlines
  ["<leader><cr>"] = { "i<cr><esc>", "Insert a newline at current position" }, 
  -- Buffer-tabs
  ["<c-tab>"] = { "<cmd>bn<cr>", "Next buffer-tab" },
  ["<c-s-tab>"] = { "<cmd>bp<cr>", "Previous buffer-tab" },
})
