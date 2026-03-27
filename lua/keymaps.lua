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

  { "<leader>q", "<cmd>close<cr>", desc = "Close current split" },

  { "<leader>e", "<cmd>Neotree toggle right<cr>", desc = "Neotree" }, -- TODO floating neotree
  -- { "<leader>d", "\"_d", desc = "Yank-less delete" },
  { "<leader>g", group = "global" },

  { "<leader>yp", "<cmd>let @* = expand(\"%d:p\")<cr>", desc = "Yank current path" },
  { "<leader>yl", "<cmd>let @* = expand('%:p') .. ':' .. line('.')<cr>", desc = "Yank current path and line" },

  { "gb", "<cmd>GoToBazel<cr>",  desc = "Goto BUILD.bazel" },
  { "gh", "<cmd>GoToHeader<cr>", desc = "Goto Header" },
  { "gs", "<cmd>GoToSource<cr>", desc = "Goto Source" },

  { "<leader>v", group = "Vsplit" },
  { "<leader>vv", function() vim.cmd.vsplit() end,  desc = "Vsplit BUILD.bazel" },
  { "<leader>vb", function() vim.cmd.vsplit(); vim.cmd.GoToBazel() end,  desc = "Vsplit Current Buffer" },
  { "<leader>vh", "<cmd>vsplit | GoToHeader<cr>", desc = "Vsplit Header" },
  { "<leader>vs", "<cmd>vsplit | GoToSource<cr>", desc = "Vsplit Source" },
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

