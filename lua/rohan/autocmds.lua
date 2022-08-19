local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Formatting
local formatting_group = augroup("Formatting", { clear = true })

autocmd("BufWritePre", {
	pattern = "*",
	callback = vim.lsp.buf.formatting_sync,
	group = formatting_group,
})
