local ok, comment = pcall(require, "Comment")
if not ok or comment == nil then
	return
end

comment.setup()
