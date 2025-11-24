return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      local actions = require('telescope.actions')
      local telescope = require('telescope')

      telescope.setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })

      require("telescope").load_extension("ui-select")
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local actions = require("telescope.actions")
      local wk = require("which-key")

      wk.add({
        { "<leader>f", group = "telescope" },
        { "<leader>fb", "<cmd>Telescope buffers<cr>",    desc = "Find buffer" },
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>",  desc = "Grep" },
        { "<leader>fr", "<cmd>Telescope resume<cr>",     desc = "Resume search" },
        { "<leader>fh", "<cmd>Telescope help_tags<cr>",  desc = "Help tags" },
      })

      require("telescope").setup({
        defaults = {
          layout_strategy = "horizontal",
          layout_config = {
            width = 0.95,
            height = 0.95,
            preview_cutoff = 120,
            horizontal = {
              preview_width = 0.55,
            },
          },
          mappings = {
            i = {
              ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
              ["<esc>"] = actions.close,
            },
            n = {
              ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
            },
          },
        },
      })
    end,
  },
}
