return {
  "hrsh7th/cmp-nvim-lsp",
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      -- set bindings on attach
      local on_attach = function(client, bufnr)
        local wk = require("which-key")
        wk.add({
          { "<leader>r", function() vim.lsp.buf.rename() end,        desc = "Rename symbol" },
          { "<leader>d", function() vim.diagnostic.open_float() end, desc = "Show diagnostics" },
          { "<leader>a", function() vim.lsp.buf.code_action() end,   desc = "Code actions" },
          { "<m-cr>",    function() vim.lsp.buf.code_action() end,   desc = "Code actions" },
          { "K",         function() vim.lsp.buf.hover() end,         desc = "Show documentation" },
        })
      end

      -- Rust
      lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- Nix
      lspconfig.nixd.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- Lua (allow global `vim`)
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

      -- C / C++ (using bear to generate compile_commands.json)
      -- You can install `clangd` via your package manager
      -- Uncomment if needed
      lspconfig.clangd.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--function-arg-placeholders",
          "--fallback-style=llvm",
        },
        filetypes = { "c", "cpp" },
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
