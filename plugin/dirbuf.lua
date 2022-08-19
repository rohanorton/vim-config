local ok, dirbuf = pcall(require, "dirbuf")
if not ok then
	return
end

dirbuf.setup({
	hash_padding = 2,
	show_hidden = true,
	sort_order = "directories_first", --"default",
	write_cmd = "DirbufSync",
})
