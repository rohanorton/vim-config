local ls = require("luasnip")
local sn = ls.snippet_node
local i = ls.insert_node
local d = ls.dynamic_node
local c = ls.choice_node
local p = require("luasnip.extras.postfix").postfix
local fmt = require("luasnip.extras.fmt").fmt

local parens = function(expr)
  return fmt("({})", { i(1, expr), i(2, ""), i(3, "--") })
end

local curly = function(expr)
  return fmt("{{{}}}", { i(1, expr), i(2, ""), i(3, "--") })
end

local square = function(expr)
  return fmt("[{}]", { i(1, expr), i(2, ""), i(3, "--") })
end

local dbl_square = function(expr)
  return fmt("[[{}]]", { i(1, expr), i(2, ""), i(3, "--") })
end

local angle = function(expr)
  return fmt("<{}>", { i(1, expr), i(2, ""), i(3, "--") })
end

local dot_br = p(".br", {
  d(1, function(_, parent)
    local expr = parent.env.POSTFIX_MATCH
    return sn(
      nil,
      c(1, {
        curly(expr),
        parens(expr),
        square(expr),
        dbl_square(expr),
        angle(expr),
      })
    )
  end),
})

return { dot_br }, {}
