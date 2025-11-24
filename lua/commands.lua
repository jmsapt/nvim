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

-- Find and resolve merge conflicts
vim.api.nvim_create_user_command("Conflicts", function(opts)
  local args = opts.fargs
  local mode = args[1] -- "ours" or "theirs"
  local confirm = not vim.tbl_contains(args, "--no-confirm")

  -- Populate quickfix list with conflicts
  vim.cmd('silent! vimgrep /^<<<<<<</j `git ls-files`')

  -- Check if any conflicts were found
  if #vim.fn.getqflist() == 0 then
    vim.notify("No merge conflicts found", vim.log.levels.INFO)
    return
  end

  vim.cmd("copen")

  -- If no mode specified, just list conflicts
  if not mode or (mode ~= "ours" and mode ~= "theirs") then
    return
  end

  -- Resolve conflicts with substitute pattern
  local pattern = mode == "ours"
    and [[%s/^<<<<<<< .*\n\(\_.\{-}\)=======\n\_.\{-}>>>>>>> .*\n/\1/]]
    or [[%s/^<<<<<<< .*\n\_.\{-}=======\n\(\_.\{-}\)>>>>>>> .*\n/\1/]]

  vim.cmd("cdo " .. (confirm and "" or "!") .. pattern .. " | update")
end, { nargs = "*" })

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
      {
        tagname = tostring(path),
        from    = { bufnr, pos[1], pos[2] + 1, 0 },      -- {bufnr, lnum, col, off}
      },
    },
  }, 'a')

  vim.cmd("edit " .. vim.fn.fnameescape(path))
end

-- TODO fix
-- vim.api.nvim_create_user_command("BazelYank", function()
--   local file = vim.fn.resolve(vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":p"))
--   local dir  = vim.fn.fnamemodify(file, ":h")
--
--   -- walk up until /home/data or filesystem root
--   while dir and dir ~= "" do
--     if dir == "/home/data" or dir == "/" then break end
--     if vim.fn.filereadable(dir .. "/BUILD.bazel") == 1 then
--       build_dir = dir
--       break
--     end
--     local next_dir = vim.fn.fnamemodify(dir, ":h")
--     if next_dir == dir then break end -- safety against infinite loop
--     dir = next_dir
--   end
--
--   if not build_dir then
--     print("Could not find BUILD.bazel")
--     return
--   end
--
--   local rdeps = "kind('.*_library', rdeps(" .. getBazelFilePath(build_dir) .. "/..., " .. getBazelFilePath(file) .. "))"
--   local lines = vim.fn.systemlist({ "bazel", "query", rdeps })
--
--   if #lines == 0 then
--     print("Not found in any BUILD.bazel")
--     return
--   end
--
--   for _, line in lines do
--     print(line)
--   end
--
--   print('Found in ' .. #lines .. ' different targets')
--   vim.fn.setreg('+', lines[1])
--   vim.fn.setreg('*', lines[1])
--   vim.fn.setreg('"', lines[1])
-- end, {})

vim.api.nvim_create_user_command("BazelGoTo", function()
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
