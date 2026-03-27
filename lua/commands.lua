local function getBazelFilePath()
  local file = vim.api.nvim_buf_get_name(0)
  if file == "" then return nil end
  file = file:gsub("\\", "/")

  local root = vim.fn.systemlist({ "git", "rev-parse", "--show-toplevel" })[1]
  if vim.v.shell_error ~= 0 or not root or root == "" then
    print("Could not determine workspace root")
    return nil
  end
  root = root:gsub("\\", "/"):gsub("/+$", "")

  local rel = file:sub(#root + 2)  -- remove root + '/'
  local dir, base = rel:match("^(.*)/([^/]+)$")
  if dir and dir ~= "" then
    return "//" .. dir .. ":" .. base
  else
    return "//:" .. rel
  end
end

local function getBazelFilePath(path)
  if not path or path == "" then
    return nil, "empty path"
  end
  path = path:gsub("\\", "/")

  local rel = path:gsub("^/home/data/[^/]+/", "")
  if rel == path then
    return nil, "path not under /home/data/*/"
  end

  local is_dir = vim.fn.isdirectory(path) == 1
  if is_dir then
    return "//" .. rel
  else
    local dir, base = rel:match("^(.*)/([^/]+)$")
    if dir and dir ~= "" then
      return "//" .. dir .. ":" .. base
    else
      return "//:" .. rel
    end
  end
end

local function open_with_tag(path)
  local win   = 0
  local pos   = vim.api.nvim_win_get_cursor(win)         -- {lnum, col0}
  local bufnr = vim.api.nvim_get_current_buf()

  -- Append a tag item whose 'from' is the current location
  vim.fn.settagstack(win, {
    items = {
      { tagname = tostring(path), from = { bufnr, pos[1], pos[2] + 1, 0 }, },
    },
  }, 'a')

  vim.cmd("edit " .. vim.fn.fnameescape(path))
end

-- #####################################################################
--
--                            Vim Functions
--
-- #####################################################################

-- Format using conform
vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format({ async = true, lsp_fallback = true, range = range })
end, { range = true })

-- Attach Lsp
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local opts = { buffer = ev.buf, silent = true }
  end,
})



-- Recursively traverses up until it finds the nearest bazel file
--
-- Bind: gb
vim.api.nvim_create_user_command("GoToBazel", function()
  local file = vim.fn.resolve(vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":p"))
  local dir  = vim.fn.fnamemodify(file, ":h")

  while dir and dir ~= "" do
    if dir == "/home/data" or dir == "/" then break end
    local build_file = dir .. "/BUILD.bazel"
    print(dir)
    if vim.fn.filereadable(build_file) == 1 then
      open_with_tag(build_file)
      return
    end
    local next_dir = vim.fn.fnamemodify(dir, ":h")
    if next_dir == dir then break end
    dir = next_dir
  end

  print("Couldn't find a BUILD.bazel")
end, {})

-- Tries to open corresponding header file for curent source file
-- TODO: roll this into 1 function
--
-- Bind: gh
vim.api.nvim_create_user_command("GoToHeader", function()
  local file = vim.fn.resolve(vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":p"))

  if not vim.endswith(file, '.cpp') then
    print("Current file is not a Cpp source file")
    return
  end

  local header = file:gsub('.cpp', '.hpp', 1)
  if vim.fn.filereadable(header) ~= 1 then
    print("Couldn't find header")
    return
  end

  open_with_tag(header)
end, {})

vim.api.nvim_create_user_command("GoToSource", function()
  local file = vim.fn.resolve(vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":p"))

  if not vim.endswith(file, '.hpp') then
    print("Current file is not a Cpp header file")
    return
  end

  local header = file:gsub('.hpp', '.cpp', 1)
  if vim.fn.filereadable(header) ~= 1 then
    print("Couldn't find header")
    return
  end

  open_with_tag(header)
end, {})


