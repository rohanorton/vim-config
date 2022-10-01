local ls = require("luasnip")
local s = ls.s -- Snippet
local i = ls.i -- Insert Node
local t = ls.t -- Text Node

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
table.insert(snippets, describe)
table.insert(snippets, it)

return snippets, autosnippets
