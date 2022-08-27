local ok, neotest = pcall(require, "neotest")
if not ok then
	return
end

neotest.setup({
	adapters = {
		require("neotest-jest")({
			jestCommand = "npm run test --",
			jestConfigFile = "jest.config.js",
			env = { CI = true },
			cwd = function()
				return vim.fn.getcwd()
			end,
		}),
		require("neotest-vim-test")({}),
	},
})

local bufopts = { noremap = true, silent = true }

-- Run the nearest test
vim.keymap.set("n", "<leader>tt", neotest.run.run, bufopts)
-- Run all tests in the file
vim.keymap.set("n", "<leader>tf", function()
	neotest.run.run(vim.fn.expand("%"))
end, bufopts)
-- View the test output
vim.keymap.set("n", "<leader>to", neotest.output.open, bufopts)
-- View the test summary
vim.keymap.set("n", "<leader>ts", neotest.summary.open, bufopts)
