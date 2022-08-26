local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Formatting
local formatting_group = augroup("Formatting", { clear = true })
autocmd("BufWritePre", {
	pattern = "*",
	callback = vim.lsp.buf.formatting_sync,
	group = formatting_group,
})

-- Autocommand that reloads neovim whenever you save the plugins.lua file
local plugin_config_changed_group = augroup("PluginConfigChanged", { clear = true })
autocmd("BufWritePost", {
	pattern = "packer.lua",
	command = "source <afile> | PackerSync",
	group = plugin_config_changed_group,
})

-- Search Highlighting
local search_highlight_group = augroup("SearchHighlight", { clear = true })
autocmd("InsertEnter", { pattern = "*", command = ":setlocal nohlsearch", group = search_highlight_group })
autocmd("InsertLeave", { pattern = "*", command = ":setlocal hlsearch", group = search_highlight_group })
