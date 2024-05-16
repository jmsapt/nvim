return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    -- "hrsh7th/nvim-cmp-lsp",
    lazy = true,
    config = function()
      local lspconfig = require("lspconfig")

      -- clangd (C/C++)
      -- Clangd Setup
      lspconfig.clangd.setup({
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--function-arg-placeholders",
          -- "-style=file:~/.config/nvim/lua/plugins/.clang-format",
          "--fallback-style=llvm",
        },
        filetypes = {
          "c",
          "cpp",
        },
        init_options = {
          usePlaceholders = true,
          completeUnimported = true,
          clangdFileStatus = true,
        },
        capabilities = {
          offsetEncoding = { "utf-16" },
        },
        handlers = {
          ["textDocument/formatting"] = function(err, _, result, _, bufnr)
            if err ~= nil or result == nil then
              return
            end
            local view = vim.fn.winsaveview()
            vim.lsp.util.apply_text_edits(result, bufnr)
            vim.fn.winrestview(view)
          end,
        },
      })

      -- Rust analyzer
      lspconfig.rust_analyzer.setup({})

      -- Lua_ls
      lspconfig.lua_ls.setup({
        -- allow global `vim`
        settings = { Lua = { diagnostics = { globals = { "vim" } } } },
      })
    end,

    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
        },
        severity_sort = true,
      },
      inlay_hints = {
        enabled = false,
      },
      codelens = {
        enabled = false,
      },
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },
    },
  },
}
