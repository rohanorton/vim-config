SAFE_REQUIRE({ "rust-tools" }, function(rust_tools)
	local on_attach = require("rohan.lsp.on-attach")

	rust_tools.setup({
		tools = {
			on_initialized = function()
				vim.cmd([[
            autocmd BufEnter,CursorHold,InsertLeave,BufWritePost *.rs silent! lua vim.lsp.codelens.refresh()
          ]])
			end,
		},
		server = {
			on_attach = on_attach,
			settings = require("rohan.lsp.settings.rust_analyzer"),
		},
	})
end)
