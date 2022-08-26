local ok, neotest = pcall(require, "neotest")
if not ok then
	return
end

neotest.setup({
	adapters = {
		require("neotest-jest")({
			jestCommand = "npm test --",
			jestConfigFile = "custom.jest.config.ts",
			env = { CI = true },
			cwd = function()
				return vim.fn.getcwd()
			end,
		}),
	},
})
