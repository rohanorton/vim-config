local ok, luapad = pcall(require, "luapad")
if not ok then
	return
end

luapad.setup({
	count_limit = 150000,
	error_indicator = true,
	error_highlight = "ErrorMsg",
	split_orientation = "vertical",
	context = {},
})
