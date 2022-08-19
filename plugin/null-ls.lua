local ok, null_ls = pcall(require, "null-ls")
if not ok then
    return
end

local diagnostics = null_ls.builtins.diagnostics 
local formatting = null_ls.builtins.formatting 


null_ls.setup {
    sources = {
        formatting.stylua,
    },
    on_attach = require "rohan.lsp.on-attach",
}
