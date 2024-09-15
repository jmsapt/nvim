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
          { "<leader>r", vim.lsp.buf.rename(),        desc = "Rename symbol" },
          { "<leader>d", vim.diagnostic.open_float(), desc = "Show diagnostics" },
          { "<leader>a",    vim.lsp.buf.code_action(),   desc = "Code actions" },
          { "<m-cr>",    vim.lsp.buf.code_action(),   desc = "Code actions" },
          { "K",         vim.lsp.buf.hover(),         desc = "Show documentation" },
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
