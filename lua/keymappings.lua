-- <Space> as Leader Key
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true })
vim.g.mapleader = ' '

-- J.K.
vim.api.nvim_set_keymap('i', 'kj', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', 'kj', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'jk', ':w<CR>', { noremap = true, silent = true })

-- Clear Highlights
vim.api.nvim_set_keymap('n', '<Esc><Esc>', ':noh<CR>', { noremap = true, silent = true })

-- Buffers
vim.api.nvim_set_keymap('n', '<Leader>b', ':buffers', { noremap = true, silent = true })

-- Go to last file
vim.api.nvim_set_keymap('n', 'gl', '<C-^>', { noremap = true, silent = true })
