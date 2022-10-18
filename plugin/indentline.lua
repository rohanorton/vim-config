SAFE_REQUIRE("indent_blankline", function(indent_blankline)
  vim.cmd([[highlight IndentBlanklineChar guibg=NONE guifg=#343434 gui=nocombine ]])
  vim.cmd([[highlight IndentBlanklineContextChar guibg=NONE guifg=#484848 gui=nocombine]])

  indent_blankline.setup({
    char = "|",
    show_current_context = true,
    show_current_context_start = false,
  })
end)
