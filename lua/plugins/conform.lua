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
      c = { "clang-format" },
      tex = { "latexindent" },
      bib = { "biblatex-tidy" },
    },
    formatters = {
      injected = { options = { ignore_errors = true } },
      ["clang-format"] = {
        prepend_args = {
          -- Default Style File
          (("-style=file:${HOME}/.config/nvim/clang-format"):gsub("${([%w_]+)}", os.getenv)),
        },
      },
      ["latexindent"] = {
        command = "latexindent",
        prepend_args = {
        }
      },
      ["biblatex-tidy"] = {
        command = "bibtex-tidy",
      }
    },
  },
}
