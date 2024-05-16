return {
  "akinsho/bufferline.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "famiu/bufdelete.nvim",
  },
  lazy = false,

  config = function()
    require("bufferline").setup({
      options = {
        -- tab appearance
        separator_style = "slant",
        always_show_bufferline = false,
        diagnostics = "nvim-lsp",

        -- mouse commands
        left_mouse_command = "buffer %d",
        middle_mouse_command = function(buffnum)
          require("bufdelete").bufdelete(bufnum, true)
        end,

        hover = {
          enabled = true,
          delay = 200,
        },

        offsets = {
          {
            filetype = "neo-tree",
            text = "NeoTree",
            highlight = "Directory",
            padding = 0,
            seperator = true,
          },
        },
      },
      highlights = require("catppuccin.groups.integrations.bufferline").get(),
    })
  end,
}
