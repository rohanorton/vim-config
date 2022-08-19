-- Attempt to run impatient (speeds up lua load times)
if not pcall(require, "impatient") then
	print("Failed to load impatient.")
end

require("rohan.global")
require("rohan.base")
require("rohan.keymaps")
require("rohan.plugins")
require("rohan.lsp")
require("rohan.colorscheme")
require("rohan.autocmds")
