SAFE_REQUIRE("toggleterm", function(toggleterm)
  toggleterm.setup({
    open_mapping = [[<C-\>]],
    insert_mappings = true,
    shade_terminals = false,
    direction = "float",
    -- size = function(term)
    --   if term.direction == "horizontal" then
    --     return 100
    --   elseif term.direction == "vertical" then
    --     return 116
    --   end
    -- end,
  })
end)
