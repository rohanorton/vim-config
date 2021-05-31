-- Helper functions 
local nnoremap = function (lhs, rhs) vim.api.nvim_set_keymap('n', lhs, rhs, { noremap = true, silent = true }) end
local inoremap = function (lhs, rhs) vim.api.nvim_set_keymap('i', lhs, rhs, { noremap = true, silent = true }) end
local xnoremap = function (lhs, rhs) vim.api.nvim_set_keymap('x', lhs, rhs, { noremap = true, silent = true }) end


-- <Space> as Leader Key
nnoremap('<Space>', '<NOP>')
vim.g.mapleader = ' '

-- J.K.
inoremap('kj', '<Esc>')
inoremap('jk', '<Esc>')

nnoremap('kj', ':w<CR>')
nnoremap('jk', ':w<CR>')

-- Clear Highlights
nnoremap('<Esc><Esc>', ':noh<CR>')

-- Buffers
nnoremap('<Leader>b', ':buffers<CR>')

-- Go to last file
nnoremap('gl', '<C-^>')

-- Move
xnoremap('K', ':move \'<-2<CR>gv-gv')
xnoremap('J', ':move \'>+1<CR>gv-gv')
