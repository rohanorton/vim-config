-- Prevent certain clients from formatting
vim.g.rohan__excluded_formatters = {
  "tsserver",
  "sumneko_lua",
}

local function format()
  vim.lsp.buf.format({
    async = false,
    filter = function(client)
      local excluded = vim.g.rohan__excluded_formatters or {}
      for _, name in ipairs(excluded) do
        if client.name == name then
          return false
        end
        return true
      end
    end,
  })
end

return format
