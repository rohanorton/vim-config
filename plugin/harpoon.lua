SAFE_REQUIRE({ "harpoon", "harpoon.mark", "harpoon.ui" }, function(harpoon, mark, ui)
	harpoon.setup({
		-- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
		save_on_toggle = false,

		-- saves the harpoon file upon every change. disabling is unrecommended.
		save_on_change = true,

		-- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
		enter_on_sendcmd = false,

		-- closes any tmux windows harpoon that harpoon creates when you close Neovim.
		tmux_autoclose_windows = false,

		-- filetypes that you want to prevent from adding to the harpoon list menu.
		excluded_filetypes = { "harpoon" },

		-- set marks specific to each git branch inside git repository
		mark_branch = false,
	})

	-- Harpoon
	local keymap_opts = { silent = true, noremap = true }
	local nmap = function(key, fn)
		vim.keymap.set("n", key, fn, keymap_opts)
	end

	nmap("<leader>a", mark.add_file)
	nmap("<leader><leader>", ui.toggle_quick_menu)

	local keys = {
		"h", -- 1
		"j", -- 2
		"k", -- 3
		"l", -- 4
	}
	for n, v in ipairs(keys) do
		nmap("<C-" .. v .. ">", function()
			ui.nav_file(n)
		end)
	end
end)
