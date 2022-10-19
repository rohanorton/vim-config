local ls = require("luasnip")
local sn = ls.snippet_node
local i = ls.insert_node
local d = ls.dynamic_node
local p = require("luasnip.extras.postfix").postfix
local fmt = require("luasnip.extras.fmt").fmt

local dot_var = p(".var", {
  d(1, function(_, parent)
    return sn(nil, fmt("local {} = {}", { i(1, "var_name"), i(2, parent.env.POSTFIX_MATCH) }))
  end),
})

return dot_var
