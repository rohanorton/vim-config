-- Attempt to run impatient (speeds up lua load times)
if not pcall(require, "impatient") then
	print("Failed to load impatient.")
end

require("rohan.global")
require("rohan.base")
require("rohan.keymaps")
require("rohan.packer")
require("rohan.lsp")
require("rohan.colorscheme")
require("rohan.autocmds")

if vim.g.neovide then
	require("rohan.neovide")
end
