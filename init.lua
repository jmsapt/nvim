-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.cmd([[
    autocmd FileType c setlocal shiftwidth=4 softtabstop=4
    autocmd FileType cpp setlocal shiftwidth=4 softtabstop=4
]])
