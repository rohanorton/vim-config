local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

local if_ = s(
  "if ",
  fmt(
    [[
if {} then
  {}
end
]],
    { i(1, ""), i(2, "") }
  )
)

return if_
