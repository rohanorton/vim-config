local ok, rust_tools = pcall(require, "rust-tools")
if not ok then
	return
end

local on_attach_without_document_formatting = require("rohan.lsp.on-attach")({ document_formatting = false })

rust_tools.setup({
	tools = {
		on_initialized = function()
			vim.cmd([[
            autocmd BufEnter,CursorHold,InsertLeave,BufWritePost *.rs silent! lua vim.lsp.codelens.refresh()
          ]])
		end,
	},
	server = {
		on_attach = on_attach_without_document_formatting,
		settings = require("rohan.lsp.settings.rust_analyzer"),
	},
})
