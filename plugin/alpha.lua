SAFE_REQUIRE({ "alpha", "alpha.themes.startify" }, function(alpha, startify)
	alpha.setup(startify.opts)

	startify.section.bottom_buttons.val = {
		startify.button("v", "Neovim Config", ":e ~/.config/nvim/init.lua<cr>"),
		startify.button("q", "Quit", ":q<cr>"),
	}
end)
