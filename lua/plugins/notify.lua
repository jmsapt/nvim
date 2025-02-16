return {
  "rcarriga/nvim-notify",
  opts = {
    render = "default",
    stages = "fade_in_slide_out",
    top_down = false,
    fps = 60,
    timeout = 3000,
    max_height = function()
      return math.floor(vim.o.lines * 0.75)
    end,
    max_width = function()
      return math.floor(vim.o.columns * 0.75)
    end,
    on_open = function(win)
      vim.api.nvim_win_set_config(win, { zindex = 100 })
    end,
  },
  init = function()
    vim.notify = require("notify")
  end,
}
