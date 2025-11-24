local wk = require("which-key")
-- w => window
-- q => quit

wk.add({
  { "<c-s-tab>", "<cmd>bp<cr>", desc = "Previous buffer-tab" },
  { "<c-tab>", "<cmd>bn<cr>", desc = "Next buffer-tab" },
  { "<leader><cr>", "i<cr><esc>", desc = "Insert a newline at current position" },
  { "<leader><space>", "<cmd>noh<cr>", desc = "Clear search highlights" },
  { "<leader>c", group = "current buffer" },
  { "<leader>cf", "<cmd>Format<cr>", desc = "Format current buffer" },
  { "<leader>e", "<cmd>Neotree toggle right<cr>", desc = "Neotree" },
  -- { "<leader>d", "\"_d", desc = "Yank-less delete" },
  { "<leader>g", group = "global" },

  { "<leader>q", group = "quit" },
  { "<leader>qQ", "<cmd>qa!<cr>", desc = "Force quit all buffers" },
  { "<leader>qq", "<cmd>wa<cr><cmd>qa<cr>", desc = "Quit all buffers (write first)" },
  { "<leader>yp", "<cmd>let @* = expand(\"%d:p\")<cr>", desc = "Yank current path" },
  { "gb", "<cmd>BazelGoTo<cr>", desc = "Goto BUILD.bazel" },
})

-- Windows
wk.add({
  {
    mode = { "n", "t", "v" },
    { "<leader>w", group = "window" },

    { "<m-down>", "<cmd>wincmd j<cr>", desc = "Focus bottom window" },
    { "<leader>wj", "<cmd>wincmd j<cr>", desc = "Focus bottom window" },

    { "<m-left>", "<cmd>wincmd h<cr>", desc = "Focus left window" },
    { "<leader>wh", "<cmd>wincmd h<cr>", desc = "Focus bottom window" },

    { "<m-right>", "<cmd>wincmd l<cr>", desc = "Focus right window" },
    { "<leader>wl", "<cmd>wincmd l<cr>", desc = "Focus bottom window" },

    { "<m-up>", "<cmd>wincmd k<cr>", desc = "Focus top window" },
    { "<leader>wk", "<cmd>wincmd k<cr>", desc = "Focus bottom window" },
  },
})

-- Telescope

-- Vimtex Documentation

