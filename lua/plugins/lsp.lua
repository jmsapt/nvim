return {
  "hrsh7th/cmp-nvim-lsp",
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- set bindings on attach
      local on_attach = function(bufnr)
        local wk = require("which-key")
        wk.add({
          { "<leader>r", function() vim.lsp.buf.rename() end,        desc = "Rename symbol" },
          { "<leader>d", function() vim.diagnostic.open_float() end, desc = "Show diagnostics" },
          { "<leader>a", function() vim.lsp.buf.code_action() end,   desc = "Code actions" },
          { "<m-cr>",    function() vim.lsp.buf.code_action() end,   desc = "Code actions" },
          { "K",         function() vim.lsp.buf.hover() end,         desc = "Show documentation" },
          {
            "<leader>h",
            function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end,
            desc =
            "Toggle type hinting"
          },
        })
      end


      -- -- Default setup servers
      local lsp_servers = { "bashls", "nixd" }
      for _, svr in ipairs(lsp_servers) do
        vim.lsp.config[svr] = {
          capabilities = capabilities,
          on_attach = on_attach,
        }
        vim.lsp.enable(svr);
      end


      -- Lua (allow global `vim`)
      vim.lsp.config["lua_ls"] = {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      }
      vim.lsp.enable("lua_ls");

      -- C/C++
      vim.lsp.config["clangd"] = {
        capabilities = capabilities,
        on_attach = on_attach,
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--enable-config",
          "--fallback-style=llvm",
          "--completion-style=basic",
        },
        filetypes = { "c", "cpp" },
      }
      vim.lsp.enable("clangd");

      -- Bazel / Starlark
      vim.lsp.config["starpls"] = {
        capabilities = capabilities,
        on_attach = on_attach,
        cmd = { "starpls" },
      }
      vim.lsp.enable("starpls");

      -- Rust
      vim.lsp.config["rust_analyzer"] = {
        capabilities = capabilities,
        on_attach = function(bufnr)
          vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end
      }
      vim.lsp.enable("rust_analyzer");
    end,


    -- appearance
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
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    config = function()
      require('tiny-inline-diagnostic').setup()
      vim.diagnostic.config({ virtual_text = false })   -- Disable default virtual text
    end
  },
  -- Bazel:
  -- GoToBazelDefinition()        " Jump to definition
  -- GoToBazelTarget()            " Jumps to the BUILD file of current buffer
  -- GetLabel()                   " Returns bazel label of target in build file
  { 'alexander-born/bazel.nvim', dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-lua/plenary.nvim' } },
}
