local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

local date = function()
  return os.date("%Y-%m-%m") --> Wednesday, 04 April 2007
end

return {
  s(
    "@article",
    fmt(
      [[
  @article{{{},
      author = {{{}}},
      title = {{{}}},
      url = {{{}}},
      date = {{{}}},
      urldate = {{{}}},
  }}
  ]],
      { i(1, "citation-label"), i(2, "Author and ..."), i(3, "Title"), i(4, "Url"), i(5, "Date Published (YYYY-MM-DD)"), i(6, date()) }
    )
  ),
}, {}
