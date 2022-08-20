local ok, null_ls = pcall(require, "null-ls")
if not ok then
	return
end

local formatting = null_ls.builtins.formatting
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	sources = {
		formatting.stylua,
		formatting.rustfmt,
		code_actions.gitsigns,
	},
	on_attach = require("rohan.lsp.on-attach")(),
})
