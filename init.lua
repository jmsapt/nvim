-- leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- lavy nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ import = "plugins" }, {
  -- change_detection = {
  --   notify = false,
  -- },
})

-- theme
-- catppuccin -> catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
-- kanagawa -> kanagawa-wave, kanagawa-dragon, kanagawa-lotus

-- source files
require("commands")
require("options")
require("keymaps")
require("spellcheck")

-- vim.cmd.colorscheme("catppuccin")
vim.cmd.colorscheme("kanagawa")
local colors = require("kanagawa.colors").setup().palette

-- -- bright orange separators
-- vim.api.nvim_set_hl(0, "WinSeparator", { fg = colors.surimiOrange, bg = colors.sumiInk0, bold = true })
-- vim.api.nvim_set_hl(0, "VertSplit",    { fg = colors.surimiOrange, bg = colors.sumiInk0, bold = true })
-- -- lualine's main line (keep your lualine config)
-- vim.api.nvim_set_hl(0, "StatusLine",   { bg = colors.surimiOrange, fg = colors.sumiInk0, bold = true })
-- vim.api.nvim_set_hl(0, "StatusLineNC", { bg = colors.surimiOrange, fg = colors.sumiInk4 })
