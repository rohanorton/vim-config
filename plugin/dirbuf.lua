SAFE_REQUIRE({ "dirbuf" }, function(dirbuf)
	dirbuf.setup({
		hash_padding = 2,
		show_hidden = true,
		sort_order = "directories_first", --"default",
		write_cmd = "DirbufSync",
	})
end)
