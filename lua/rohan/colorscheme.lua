SAFE_REQUIRE("gruvbox", function(gruvbox)
  -- Setup must be called before loading the colorscheme
  gruvbox.setup({
    overrides = {
      SignColumn = { link = "NormalNC" },
    },
    palette_overrides = {},

    -- Defaults...
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
      strings = true,
      comments = true,
      operators = false,
      folds = false,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "", -- can be "hard", "soft" or empty string
    dim_inactive = false,
    transparent_mode = false,
  })

  -- Load colorscheme
  vim.cmd("colorscheme gruvbox")
end)
