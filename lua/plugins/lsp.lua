-- lua/plugins/lsp.lua

return {
    "neovim/nvim-lspconfig",

    dependencies = {
        "williamboman/mason.nvim",
    },

    config = function()
        local lspconfig = require("lspconfig")
        -- local mason = require("mason")

        -- mason.setup()

        -- Clangd Setup
        lspconfig.clangd.setup({
            cmd = {
                "clangd",
                "--background-index",
                "--clang-tidy",
                "--header-insertion=iwyu",
                "--completion-style=detailed",
                "--function-arg-placeholders",
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
                end
            },
        })

        -- Rust Analyzer Setup
        lspconfig.rust_analyzer.setup({
            flags = flags,
            capabilities = capabilities,
            on_attach = on_attach,
            on_attach = function(client, bufnr)
                vim.lsp.inlay_hint.enable(bufnr)
            end,
            settings = {
                ["rust-analyzer"] = {
                    imports = {
                        granularity = {
                            group = "module",
                        },
                        prefix = "self",
                    },
                    cargo = {
                        buildScripts = {
                            enable = true,
                        },
                    },
                    procMacro = {
                        enable = true,
                    },
                },
            },
        })
    end,
}
