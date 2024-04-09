return {

    "catppuccin/nvim",
    lazy = false,
    name = "custom",
    -- you can do it like this with a config function
    config = function()
        require("catppuccin").setup({
            flavour = "macchiato",
            transparent_background = true,
        })
    end,
}
