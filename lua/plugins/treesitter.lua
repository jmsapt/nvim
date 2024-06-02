return {
  {
    event = {"BufRead", "BufNewFile"},
    lazy = true,
    "nvim-treesitter/nvim-treesitter-context",
  },
  {
    event = {"BufRead", "BufNewFile"},
    lazy = true,
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require('nvim-treesitter.configs').setup({ indent = { enable = true }, })
      require("nvim-treesitter").setup({})
    end,
  },
}
