local au = vim.api.nvim_create_autocmd

au({ "BufRead", "BufNewFile" }, {
	pattern = "LICENSE",
	command = "set filetype=license",
})
