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
  return os.date("%B %Y") --> Wednesday, 04 April 2007
end

return {
  -- Templates
  s(
    "basic-template",
    fmt(
      [[
    \documentclass{{article}}
    \usepackage{{graphicx}}               % Required for inserting images
    \usepackage[hidelinks]{{hyperref}}    % Clickable links

    \title{{{}}}
    \author{{James Appleton}}
    \date{{{}}}

    \begin{{document}}
    \maketitle
    
    {}

    \end{{document}}
    ]],
      { i(1), f(date), i(0) }
    )
  ),
  -- Figures
  s(
    "\\begin{figure}",
    fmt(
      [[
    \begin[width=0.75\texwidth]{{figure}}
        \centering
        \includegraphics{{{}}}
        \caption{{{}}}
        \label{{fig:{}}}
    \end{{figure}}
    ]],
      { i(1, "image/path"), i(2, "Caption"), i(3, "enter-label") }
    )
  ),
  -- Table
  s(
    "\\begin{table}",
    fmt(
      [[
      \begin{{table}}[]
          \centering
          \begin{{tabular}}{{ {} }}
              {}
          \end{{tabular}}
          \caption{{{}}}
          \label{{tab:{}}}
      \end{{table}}
      ]],
      {
        i(1, "c | c"),
        i(0),
        i(2, "Caption"),
        i(3, "my_table"),
      }
    )
  ),
}, {
  -- Greek Letters
  s("pi", t("\\pi")),
  s(";a", t("\\alpha")),
  s(";A", t("\\Alpha")),
  s(";b", t("\\beta")),
  s(";B", t("\\Beta")),
  s(";t", t("\\theta")),
  s(";T", t("\\Theta")),
  s(";g", t("\\gamma")),
  s(";G", t("\\Gamma")),
  s(";o", t("\\omega")),
  s(";O", t("\\Omega")),
  s(";s", t("\\sigma")),
  s(";S", t("\\Sigma")),
  s(";p", t("\\phi")),
  s(";P", t("\\Phi")),
}
