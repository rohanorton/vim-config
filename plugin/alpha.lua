local ok, alpha = pcall(require, "alpha")
if not ok or alpha == nil then
	return
end

local startify = require("alpha.themes.startify")

alpha.setup(startify.opts)

startify.section.bottom_buttons.val = {
	startify.button("v", "Neovim Config", ":e ~/.config/nvim/init.lua<cr>"),
	startify.button("q", "Quit", ":q<cr>"),
}
