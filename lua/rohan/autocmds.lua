local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Formatting
autocmd("BufWritePre", {
	pattern = "*",
	callback = vim.lsp.buf.formatting_sync,
	group = augroup("Formatting", { clear = true }),
})

-- Autocommand that reloads neovim whenever you save the plugins.lua file
autocmd("BufWritePost", {
	pattern = "packer.lua",
	command = "source <afile> | PackerSync",
	group = augroup("PluginConfigChanged", { clear = true }),
})

-- Search Highlighting
local search_highlight_group = augroup("SearchHighlight", { clear = true })
autocmd("InsertEnter", { pattern = "*", command = ":setlocal nohlsearch", group = search_highlight_group })
autocmd("InsertLeave", { pattern = "*", command = ":setlocal hlsearch", group = search_highlight_group })

-- Make Help fullscreen
autocmd("BufEnter", {
	pattern = "*",
	callback = function()
		if vim.bo.filetype == "help" then
			vim.cmd("ZoomWinTabIn")
		end
	end,
	group = augroup("OnHelp", { clear = true }),
})

-- Hide cursorline on inactive windows
local cursorline_group = augroup("CursorLine", { clear = true })
autocmd("WinEnter", { pattern = "*", command = "set cul", group = cursorline_group })
autocmd("WinLeave", { pattern = "*", command = "set nocul", group = cursorline_group })
