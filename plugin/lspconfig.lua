local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
	return
end

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}

lspconfig["sumneko_lua"].setup({
	on_attach = function(client, bufnr)
		-- HACK: Turn off sumneko document formatting
		if client.name == "sumneko_lua" then
			client.resolved_capabilities.document_formatting = false
		end
		require("rohan.lsp.on-attach")(client, bufnr)
	end,
	flags = lsp_flags,
	settings = require("rohan.lsp.settings.sumneko_lua"),
})
