local wk = require("which-key")
-- w => window
-- q => quit

vim.opt_local.spelllang = "en_au"

wk.add({
  { "<leader>s", function ()
      local state = not vim.opt_local.spell:get()
      vim.opt_local.spell = state
      vim.notify((state and "  " or "  ")
        .. "Toggled spell check "
        .. (state and "on" or "off"),
        vim.log.levels.INFO)
  end, desc = "Toggle spell checking" },
});

-- enable spellcheck for commit message
vim.api.nvim_create_autocmd("FileType", {
    pattern = "gitcommit",
    callback = function()
        vim.opt_local.spell = true
    end,
})
