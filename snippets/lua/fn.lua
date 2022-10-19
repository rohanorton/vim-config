local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt

local name_first = fmt(
  [[
local {} = function ({})
  {}
end
]],
  { i(1, "name"), i(2, ""), i(3, "--") }
)

local function_first = fmt(
  [[
local function {}({})
  {}
end
]],
  { i(1, "name"), i(2, ""), i(3, "--") }
)

local no_local_function = fmt(
  [[
function {}({})
  {}
end
]],
  { i(1, "name"), i(2, ""), i(3, "--") }
)

local fn = s(
  "fn",
  c(1, {
    name_first,
    function_first,
    no_local_function,
  })
)

return fn
