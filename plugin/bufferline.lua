SAFE_REQUIRE({ "bufferline" }, function(bufferline)
	bufferline.setup({
		options = {
			numbers = function(opts)
				return string.format("[%s]", opts.ordinal)
			end,
		},
	})
end)
