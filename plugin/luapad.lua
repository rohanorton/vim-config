SAFE_REQUIRE({ "luapad" }, function(luapad)
	luapad.setup({
		count_limit = 150000,
		error_indicator = true,
		error_highlight = "ErrorMsg",
		split_orientation = "vertical",
		context = {},
	})
end)
