SAFE_REQUIRE("toggleterm", function(toggleterm)
  toggleterm.setup({
    open_mapping = [[<C-\>]],
    insert_mappings = true,
    shade_terminals = false,
    direction = "float",
    persist_mode = false,
    persist_size = false,
  })
end)
