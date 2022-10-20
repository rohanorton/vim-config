local Set = require("rohan.util.set")

-- Prevent certain clients from formatting
vim.g.rohan__formatters_enabled = true
-- Prevent certain clients from formatting
vim.g.rohan__excluded_formatters = {
  "tsserver",
  "sumneko_lua",
}

local function format()
  if not vim.g.rohan__formatters_enabled then
    return
  end

  local excluded = Set(vim.g.rohan__excluded_formatters or {})

  vim.lsp.buf.format({
    async = false,
    filter = function(client)
      return not excluded[client.name]
    end,
  })
end

return format
