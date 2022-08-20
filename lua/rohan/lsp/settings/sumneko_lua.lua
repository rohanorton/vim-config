return {
	Lua = {
		runtime = {
			version = "LuaJIT",
		},
		diagnostics = {
			globals = { "vim", "use", "require", "P" },
		},
		workspace = {
			library = vim.api.nvim_get_runtime_file("", true),
		},
		telemetry = { enable = false },
		format = { enable = false }, -- Only use stylua for formatting.
	},
}
