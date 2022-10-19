local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

local if_else = s(
  "ifelse ",
  fmt(
    [[
if {} then
  {}
else
  {}
end
]],
    { i(1, ""), i(2, ""), i(3, "") }
  )
)

return if_else
