-- vscode like moving of lines and codeblock
-- config here is default (included for concisness)
return {
  "echasnovski/mini.move",
  lazy = true,
  options = {
    -- Automatically reindent selection during linewise vertical move
    reindent_linewise = true,
  },
  -- Module mappings. Use `''` (empty string) to disable one.
  mappings = {
    -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
    left = '<M-h>',
    right = '<M-l>',
    down = '<M-j>',
    up = '<M-k>',

    -- Move current line in Normal mode
    line_left = '<M-h>',
    line_right = '<M-l>',
    line_down = '<M-j>',
    line_up = '<M-k>',
  },
  config = function()
    require("mini.move").setup()
  end,
}
