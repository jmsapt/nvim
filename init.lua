-- leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Lavy Nvim plugin manager
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

-- Source files
require("commands")
require("options")
require("keymaps")
require("spellcheck")

-- vim.cmd.colorscheme("catppuccin")
vim.cmd.colorscheme("kanagawa")
local colors = require("kanagawa.colors").setup().palette
vim.api.nvim_set_hl(0, "WinSeparator", { fg = colors.crystalBlue, bg = colors.sumiInk0, bold = true })
