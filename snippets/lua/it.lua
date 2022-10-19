local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

local it = s(
  "it",
  fmt(
    [[
it("{}", function ()
  {}
end)
]],
    { i(1, ""), i(2, "--") }
  )
)

return it
