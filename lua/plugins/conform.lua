return {
  "stevearc/conform.nvim",
  name = "conform",
  lazy = true,
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "black" },
      javascript = { "prettier" },
      json = { "prettier" },
      bash = { "shfmt" },
      rust = { "rustfmt" },
    },
  },
}
