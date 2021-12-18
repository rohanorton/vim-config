require'alpha'.setup(require'alpha.themes.startify'.opts)

local startify = require('alpha.themes.startify')
startify.section.bottom_buttons.val = {
    startify.button('v', 'Neovim Config', ':e ~/.config/nvim/init.lua<cr>'),
    startify.button('q', 'Quit', ':q<cr>')
}
