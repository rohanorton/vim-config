SAFE_REQUIRE({
  "telescope",
  "telescope.actions",
}, function(telescope, actions)
  telescope.setup({
    defaults = {
      mappings = {
        i = {
          -- Close on <esc> in insert mode
          ["<esc>"] = actions.close,
        },
      },
    },
  })
end)
