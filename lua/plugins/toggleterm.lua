return {
  "akinsho/toggleterm.nvim", 
  config = function()
    require("toggleterm").setup({
      start_in_insert = true,
    })
  end,
}
