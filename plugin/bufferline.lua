local ok, bufferline = pcall(require, "bufferline")
if not ok then
	return
end

bufferline.setup({
	options = {
		numbers = function(opts)
			return string.format("[%s]", opts.ordinal)
		end,
	},
})
