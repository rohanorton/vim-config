local opts = { silent = true, noremap = true }

vim.keymap.set("n", "<leader>du", ":DBUIToggle<CR>", opts)
vim.keymap.set("n", "<leader>df", ":DBUIFindBuffer<CR>", opts)
vim.keymap.set("n", "<leader>dr", ":DBUIRenameBuffer<CR>", opts)
vim.keymap.set("n", "<leader>dl", ":DBUILastQueryInfo<CR>", opts)

vim.g.db_ui_save_location = "~/.config/db_ui"
