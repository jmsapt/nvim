return {
  "lukas-reineke/indent-blankline.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  opts = {
    debounce = 200,
    indent = {
      char = "│",
      tab_char = "│",
    },
    scope = { show_start = false, show_end = false },
    exclude = {
      filetypes = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
      },
    },
  },
}
