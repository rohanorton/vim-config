vim.opt_local.formatoptions = ""
  .. "t" -- Auto-wrap
  .. "a" -- Auto-format paragraphs
  .. "c" -- Auto-wrap comments
  .. "q" -- Allow comment formatting with gq
  .. "l" -- Break long lines in insert mode
  .. "n" -- Indent numbered lists

SAFE_REQUIRE("no-autowrap-codeblock", function(no_autowrap_codeblock)
  no_autowrap_codeblock.enable()
end)
