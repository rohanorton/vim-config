local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
	return
end

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}

local on_attach = require("rohan.lsp.on-attach")()
local on_attach_without_document_formatting = require("rohan.lsp.on-attach")({ document_formatting = false })

lspconfig["sumneko_lua"].setup({
	on_attach = on_attach_without_document_formatting,
	flags = lsp_flags,
	settings = require("rohan.lsp.settings.sumneko_lua"),
})

lspconfig["taplo"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
})

lspconfig["tsserver"].setup({
	on_attach = on_attach_without_document_formatting,
	flags = lsp_flags,
})
