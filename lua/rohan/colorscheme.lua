local status_ok, gruvbox = pcall(require, "gruvbox")
if not status_ok then
  return
end

-- Setup must be called before loading the colorscheme
gruvbox.setup({
  -- Add custom overrides here
  overrides = {
    -- E.G.
    -- SignColumn = {bg = "#ff9900"}
  },

  -- Defaults...
  undercurl = true,
  underline = true,
  bold = true,
  italic = true,
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
})

-- Load colorscheme
vim.cmd("colorscheme gruvbox")
