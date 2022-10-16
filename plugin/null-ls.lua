SAFE_REQUIRE({ "null-ls" }, function(null_ls)
  local formatting = null_ls.builtins.formatting
  local code_actions = null_ls.builtins.code_actions

  null_ls.setup({
    sources = {
      formatting.stylua,
      formatting.rustfmt,
      formatting.prettierd,
      formatting.black,
      formatting.isort, -- Sort Python imports
      code_actions.gitsigns,
    },
    on_attach = require("rohan.lsp.on-attach"),
  })
end)
