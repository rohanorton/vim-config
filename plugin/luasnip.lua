SAFE_REQUIRE({ "luasnip", "luasnip.loaders.from_lua", "luasnip.util.types" }, function(ls, from_lua, types)
	from_lua.load({ paths = "~/.config/nvim/snippets" })

	ls.config.set_config({
		history = true,
		updateevents = "TextChanged,TextChangedI",
		enable_autosnippets = true,
		ext_opts = {
			[types.choiceNode] = {
				active = {
					virt_text = { { ">", "GruvboxOrange" } },
				},
			},
		},
	})
end)
