-- NOTE: Because luasnip loads snippet files in a new context, require path is a bit busted.
local function require_from_vim_root(modname)
  return dofile(vim.env.HOME .. "/.config/nvim/" .. modname .. ".lua")
end

local snippets = {
  -- Test Specific
  require_from_vim_root("snippets/lua/describe"),
  require_from_vim_root("snippets/lua/it"),

  -- Conditional
  require_from_vim_root("snippets/lua/if"),
  require_from_vim_root("snippets/lua/if_else"),

  -- Postfix
  require_from_vim_root("snippets/lua/dot_fn"),
  require_from_vim_root("snippets/lua/dot_if"),
  require_from_vim_root("snippets/lua/dot_else"),
  require_from_vim_root("snippets/lua/dot_br"),
  require_from_vim_root("snippets/lua/dot_var"),
}
local autosnippets = {}

return snippets, autosnippets
