return {
  "L3MON4D3/LuaSnip",
  -- follow latest release.
  version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  -- install jsregexp (optional!).
  build = "make install_jsregexp",
  config = function()
    local ls = require("luasnip")
    ls.setup({ enable_autosnippets = true })

    require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/snippets"})
    -- scroll down in snippet
    vim.keymap.set({ "i", "s" }, "<c-j>", function()
      if ls.expand_or_jumpable() then
        ls.expand_or_jump()
      end
    end)

    -- scroll down up snippet
    vim.keymap.set({ "i", "s" }, "<c-k>", function()
      if ls.jumpable(-1) then
        ls.jump(-1)
      end
    end)

    -- vim.keymap.set({ "i", "s" }, "<a-n>", function()
    --   if ls.choice_active() then
    --     ls.change_choice()
    --   end
    -- end)
  end,
}
