return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = true,
  init = function()
	local lualine = require('lualine').setup({
      options = { theme = "catppuccin" },
      disabled_filetype = { 'neo-tree' },
    })
  end,	
}
