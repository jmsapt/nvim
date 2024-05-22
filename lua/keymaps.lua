local wk = require("which-key")
local gitsigns = require("gitsigns")

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
  -- ["<leader>h"] = {
  --   name = "+git hunk",
  --   s = { gitsigns.stage_hunk, "Stage hunk" },
  --   r = { gitsigns.rest_hunk, "Reset hunk" },
  --   S = { gitsigns.stage_buffer, "Stage buffer" },
  --   R = { gitsigns.rest_hunk, "Reset buffer" },
  --   p = { gitsigns.rest_hunk, "Preview hunk" },
  -- },
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
  -- Toggle
  ["<leader>t"] = {
    name = "+toggle",
    l = { ":wa<cr>:qa<cr>", "Toggle LSP" },
  },
  -- Rename
  -- ["<leader>rn"] = { vim.lsp.buf.rename(), "Rename symbol" },
  -- Neotree
  ["<leader>e"] = { "<cmd><cr>", "Neotree" },
  ["<leader><space>"] = { "<cmd>noh<cr>", "Clear search highlights" },
  -- Insert newlines
  ["<leader><cr>"] = { "i<cr><esc>", "Insert a newline at current position" },
  -- Buffer-tabs
  ["<c-tab>"] = { "<cmd>bn<cr>", "Next buffer-tab" },
  ["<c-s-tab>"] = { "<cmd>bp<cr>", "Previous buffer-tab" },
  -- Toggle Term
  ["<c-j>"] = { "<cmd>ToggleTerm<cr>", "Previous buffer-tab", mode = { 'i', 'n', 'v', 't' } },
})
