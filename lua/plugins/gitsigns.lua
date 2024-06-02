return {
  "lewis6991/gitsigns.nvim",
  lazy = true,
  event = {"BufReadPre", "BufNewFile"},
  config = function()
    require("gitsigns").setup({})
  end,
}
