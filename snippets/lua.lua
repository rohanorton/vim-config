local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local i = ls.insert_node
local t = ls.text_node
local f = ls.function_node
local p = require("luasnip.extras.postfix").postfix

local fmt = require("luasnip.extras.fmt").fmt

local snippets = {}
local autosnippets = {}

-- Lua Test
-- TODO: Change to only be available in *_spec.lua files.
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

table.insert(snippets, describe)

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

table.insert(snippets, it)

local dot_if = p(".if", {
  d(1, function(_, parent)
    return sn(
      nil,
      fmt(
        [[
if {} then
  {}
end
]],
        { i(1, parent.env.POSTFIX_MATCH), i(2, "") }
      )
    )
  end),
})

table.insert(snippets, dot_if)

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

table.insert(snippets, dot_else)

local dot_fn = p(".fn", {
  d(1, function(_, parent)
    return sn(
      nil,
      fmt(
        [[
local function {}({})
  {}
end
]],
        { i(1, parent.env.POSTFIX_MATCH), i(2, ""), i(3, "--") }
      )
    )
  end),
})

table.insert(snippets, dot_fn)

local dot_br = p(".br", {
  l("{" .. l.POSTFIX_MATCH .. "}"),
})

table.insert(snippets, dot_br)

local dot_par = p(".par", {
  l("(" .. l.POSTFIX_MATCH .. ")"),
})

table.insert(snippets, dot_par)

local dot_var = p(".var", {
  d(1, function(_, parent)
    return sn(nil, fmt("local {} = {}", { i(1, "variable_name"), i(2, parent.env.POSTFIX_MATCH) }))
  end),
})

table.insert(snippets, dot_var)

return snippets, autosnippets
