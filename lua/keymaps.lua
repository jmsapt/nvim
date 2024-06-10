local wk = require("which-key")
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

  -- Neotree
  ["<leader>e"] = { "<cmd>Neotree toggle right<cr>", "Neotree" },
  ["<leader><space>"] = { "<cmd>noh<cr>", "Clear search highlights" },
  -- Insert newlines
  ["<leader><cr>"] = { "i<cr><esc>", "Insert a newline at current position" },
  -- Buffer-tabs
  ["<c-tab>"] = { "<cmd>bn<cr>", "Next buffer-tab" },
  ["<c-s-tab>"] = { "<cmd>bp<cr>", "Previous buffer-tab" },
})

-- Windows
wk.register({
  ["<m-right>"] = { "<cmd>wincmd l<cr>", "Focus right window" },
  ["<m-left>"] = { "<cmd>wincmd h<cr>", "Focus left window" },
  ["<m-down>"] = { "<cmd>wincmd j<cr>", "Focus bottom window" },
  ["<m-up>"] = { "<cmd>wincmd k<cr>", "Focus top window" },
  mode = { "n", "v", "t" },
})

-- Telescope
wk.register({
  name = "+telescope",
  ["<leader>f"] = {
    ["f"] = { "<cmd>Telescope find_files<cr>", "Find files" },
    ["g"] = { "<cmd>Telescope live_grep<cr>", "Grep" },
    ["b"] = { "<cmd>Telescope buffers<cr>", "Find buffer" },
    ["h"] = { "<cmd>Telescope help_tags<cr>", "Help tags" },
  },
  mode = { "n" },
})

-- Vimtex Documentation

