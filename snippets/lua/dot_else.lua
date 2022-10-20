local ls = require("luasnip")
local sn = ls.snippet_node
local i = ls.insert_node
local d = ls.dynamic_node
local p = require("luasnip.extras.postfix").postfix
local fmt = require("luasnip.extras.fmt").fmt

local dot_else = p(".else", {
  d(1, function(_, parent)
    return sn(
      nil,
      fmt(
        [[
if not {} then
  {}
end
]],
        { i(1, parent.env.POSTFIX_MATCH), i(2, "") }
      )
    )
  end),
})

return { dot_else }, {}
