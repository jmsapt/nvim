return {
  "williamboman/mason-lspconfig.nvim",
  "williamboman/mason.nvim",
  "hrsh7th/cmp-nvim-lsp",
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({ ensure_installed = { "lua_ls" } })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      -- set bindings on attach
      local on_attach = function(client, bufnr)
        local wk = require("which-key")
        wk.register({
          ["<leader>r"] = { vim.lsp.buf.rename, "Rename symbol" },
          ["K"] = { vim.lsp.buf.hover, "Show documentation" },
          ["<leader>d"] = { vim.diagnostic.open_float, "Show diagnostics" },
          ["<m-cr>"] = { vim.lsp.buf.code_action, "Code actions" },
        })
      end

      -- Place all lsp setups inside this
      require("mason-lspconfig").setup_handlers({
        function(server_name) -- default handler (optional)
          lspconfig[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
          })
        end,
        -- Rust
        ["rust_analyzer"] = function()
          lspconfig.rust_analyzer.setup({
            capabilities = capabilities,
            on_attach = on_attach,
          })
        end,
        -- Lua
        ["lua_ls"] = function()
          lspconfig.lua_ls.setup({
            -- allow global `vim`
            capabilities = capabilities,
            on_attach = on_attach,
            settings = { Lua = { diagnostics = { globals = { "vim" } } } },
          })
        end,
        -- Instead of setting clangd for C/C++, just use bear
        -- to create the compile_commands.json file in the root
        --
        -- Otherwise clangd will get confused between C/C++
        --
        -- -- C / C++
        -- ["clangd"] = function()
        --   lspconfig.clangd.setup({
        --     capabilities = capabilities,
        --     cmd = {
        --       "clangd",
        --       "--background-index",
        --       "--clang-tidy",
        --       "--header-insertion=iwyu",
        --       "--completion-style=detailed",
        --       "--function-arg-placeholders",
        --       -- "-style=file:~/.config/nvim/lua/plugins/.clang-format",
        --       "--fallback-style=llvm",
        --     },
        --     filetypes = {
        --       "c",
        --       "cpp",
        --     },
        --   })
        -- end,
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
