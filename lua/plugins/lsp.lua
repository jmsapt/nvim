-- lua/plugins/lsp.lua

return {
    "neovim/nvim-lspconfig",

    dependencies = {
        "williamboman/mason.nvim",
    },
    lazy = true,
    config = function()
        local lspconfig = require("lspconfig")

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
        --[[ Rust Analyzer Setup
        local on_attach = function(client)
            require("completion").on_attach(client)
        end
        lspconfig.rust_analyzer.setup({
            flags = flags,
            capabilities = capabilities,
            on_attach = on_attach,
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
        --]]
    end,
}
