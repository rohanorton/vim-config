local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

local describe = s(
  "describe",
  fmt(
    [[
describe("{}", function ()
  {}
end)
]],
    { i(1, ""), i(2, "--") }
  )
)

return describe
