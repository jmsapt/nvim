-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------
local function map(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--Remap space as leader key
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- nvim-tree bindings
map('n', '<C-e>', ':NvimTreeToggle<CR>')

-- toggle term bindings
map('n', '<C-j>', ':ToggleTerm<CR>')


-----------------------------------------------------------
-- Kickstart defaults
-----------------------------------------------------------

