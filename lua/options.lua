local opt = vim.opt

-- line numbering & scrolling
opt.relativenumber = true
opt.number = true
opt.scrolloff = 5

-- tabs and indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.smartcase = true
opt.smarttab = true
--opt.autoindent = true
opt.list = true

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- colours
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
vim.cmd("colorscheme catppuccin") -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha

-- status line & sign column
opt.laststatus = 3
