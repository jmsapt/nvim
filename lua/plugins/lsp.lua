-- lua/plugins/lsp.lua

return {
    {
        "neovim/nvim-lspconfig",
        init = function()
            local keys = require("lazyvim.plugins.lsp.keymaps").get()
            -- change keymap for "Hover"
            keys[#keys + 1] = { "gK", vim.lsp.buf.hover, desc = "Hover" }
            -- disable the original keymap for "Hover"
            keys[#keys + 1] = { "K", false }

            -- add keymap for "change source/header"
            keys[#keys + 1] = { "<leader>cs", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header" }

            -- disable automatic header inclusion
        end,

        -- disable format on save
        opts = function(_, opts)
            -- opts.autoformat = false
            opts.servers = {
                clangd = {
                    cmd = {
                        "clangd",
                        "--background-index",
                        "--clang-tidy",
                        "--header-insertion=iwyu",
                        "--completion-style=detailed",
                        "--function-arg-placeholders",
                        "--fallback-style=llvm",
                        "--header-insertion=never",
                        "--sort-includes=false",
                    },
                },
            }
        end,
    },
    -- This is a separate table for configuring LSP servers
}
