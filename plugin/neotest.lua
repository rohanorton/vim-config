SAFE_REQUIRE(
  { "neotest", "neotest-jest", "neotest-vim-test", "neotest-plenary" },
  function(neotest, neotest_jest, neotest_vim_test, neotest_plenary)
    vim.cmd([[let test#strategy = "toggleterm"]])

    neotest.setup({
      adapters = {
        neotest_jest({
          jestCommand = "npm run test --",
          jestConfigFile = "jest.config.js",
          env = { CI = true },
          cwd = function()
            return vim.fn.getcwd()
          end,
        }),
        neotest_vim_test({}),
        neotest_plenary,
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
  end
)
