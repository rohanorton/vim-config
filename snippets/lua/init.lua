local snippets = {
  -- Test Specific
  require("snippets.lua.describe"),
  require("snippets.lua.it"),

  -- Conditsnippets.ional
  require("snippets.lua.if"),
  require("snippets.lua.if_else"),

  -- Postfisnippets.x
  require("snippets.lua.dot_fn"),
  require("snippets.lua.dot_if"),
  require("snippets.lua.dot_else"),
  require("snippets.lua.dot_br"),
  require("snippets.lua.dot_var"),
}
local autosnippets = {}

return snippets, autosnippets
