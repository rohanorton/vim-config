SAFE_REQUIRE({ "luasnip", "luasnip.loaders.from_lua", "luasnip.util.types" }, function(ls, from_lua, types)
  local snippet_path = vim.env.HOME .. "/.config/nvim/snippets/?.lua"
  local snip_path = snippet_path .. ";" .. package.path

  ls.config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = true,
    snip_path = snip_path,
    ext_opts = {
      [types.choiceNode] = {
        active = {
          virt_text = { { ">", "GruvboxOrange" } },
        },
      },
    },
  })

  from_lua.load({ paths = "~/.config/nvim/snippets" })
end)
