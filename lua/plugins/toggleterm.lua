return {
  "akinsho/toggleterm.nvim",
  event = {"BufRead", "BufNewFile"},
  lazy = true,
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<c-j>]],
      start_in_insert = true,
    })
  end,
}
