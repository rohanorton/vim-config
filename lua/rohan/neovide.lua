-- Neovide Options
vim.g.neovide_refresh_rate = 60
vim.g.neovide_refresh_rate_idle = 5
vim.g.neovide_transparency = 1
vim.g.neovide_scroll_animation_length = 0.1
vim.g.neovide_cursor_animation_length = 0
vim.g.neovide_confirm_quit = true

-- Paste from clipboard
local keymap_options = { silent = true, noremap = true }

vim.keymap.set({ "n", "t", "v" }, "<D-v>", '"+p', keymap_options)
vim.keymap.set({ "i", "c" }, "<D-v>", "<C-r>+", keymap_options)
