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

-- Change leader to a comma
vim.g.mapleader = ' '

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------



-----------------------------------------------------------
-- Plugin bindings
-----------------------------------------------------------

-- nvim-tree bindings
map('n', '<C-e>', ':NvimTreeToggle<CR>')

-- toggle term bindings
map('n', '<C-j>', ':ToggleTerm<CR>')
