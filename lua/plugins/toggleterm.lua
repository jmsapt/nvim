return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<c-j>]],
      start_in_insert = true,
    })
  end,
}
