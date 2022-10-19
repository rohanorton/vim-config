local snippet_path = vim.env.HOME .. "/.config/nvim/snippets/?.lua"
package.path = table.concat({ snippet_path, package.path }, ";")

local snippets = {
  -- Test Specific
  require("lua.describe"),
  require("lua.it"),

  -- Conditional
  require("lua.if"),
  require("lua.if_else"),

  -- Postfix
  require("lua.dot_fn"),
  require("lua.dot_if"),
  require("lua.dot_else"),
  require("lua.dot_br"),
  require("lua.dot_var"),
}
local autosnippets = {}

return snippets, autosnippets
