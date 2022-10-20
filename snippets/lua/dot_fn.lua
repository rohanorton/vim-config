local ls = require("luasnip")
local sn = ls.snippet_node
local i = ls.insert_node
local d = ls.dynamic_node
local c = ls.choice_node
local p = require("luasnip.extras.postfix").postfix
local fmt = require("luasnip.extras.fmt").fmt

local name_first = function(fname)
  return fmt(
    [[
local {} = function ({})
  {}
end
]],
    { i(1, fname), i(2, ""), i(3, "--") }
  )
end

local function_first = function(fname)
  return fmt(
    [[
local function {}({})
  {}
end
]],
    { i(1, fname), i(2, ""), i(3, "--") }
  )
end

local no_local_function = function(fname)
  return fmt(
    [[
function {}({})
  {}
end
]],
    { i(1, fname), i(2, ""), i(3, "--") }
  )
end

local dot_fn = p(".fn", {
  d(1, function(_, parent)
    -- Currently fname is just the last word of the match :(
    -- It would be nice if we could match on Foo.bar or Foo:bar
    -- in order to choose "global_function" (sic.) for that as default
    local fname = parent.env.POSTFIX_MATCH
    return sn(
      nil,
      c(1, {
        name_first(fname),
        function_first(fname),
        no_local_function(fname),
      })
    )
  end),
})

return { dot_fn }, {}
