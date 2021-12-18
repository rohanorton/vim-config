-- Helper functions 
local nnoremap = function(lhs, rhs)
    vim.api.nvim_set_keymap('n', lhs, rhs, {noremap = true, silent = true})
end
local inoremap = function(lhs, rhs)
    vim.api.nvim_set_keymap('i', lhs, rhs, {noremap = true, silent = true})
end
local xnoremap = function(lhs, rhs)
    vim.api.nvim_set_keymap('x', lhs, rhs, {noremap = true, silent = true})
end

-- <Space> as Leader Key
nnoremap('<Space>', '<NOP>')
vim.g.mapleader = ' '

-- J.K.
inoremap('kj', '<Esc>')
inoremap('jk', '<Esc>')

nnoremap('kj', ':w<CR>')
nnoremap('jk', ':w<CR>')

-- Clear Highlights
nnoremap('<Esc><Esc>', ':nohlsearch<CR>')

-- Buffers
nnoremap('<Leader>b', ':buffers<CR>')

-- Go to last file
nnoremap('gl', '<C-^>')

-- Move
xnoremap('K', ':move \'<-2<CR>gv-gv')
xnoremap('J', ':move \'>+1<CR>gv-gv')

-- Telescope
nnoremap('<C-p>', '<Cmd>Telescope find_files<CR>')
nnoremap('<Leader>p', '<Cmd>Telescope find_files<CR>')

nnoremap('<Leader>a', '<Cmd>Telescope live_grep<CR>')
nnoremap('<Leader>/', '<Cmd>Telescope live_grep<CR>')

nnoremap('<Leader>b', '<Cmd>Telescope buffers<CR>')

nnoremap('<Leader>h', '<Cmd>Telescope help_tags<CR>')

-- Buffers
nnoremap('<Leader><Tab>', ':bnext<CR>')
nnoremap('<Leader><S-Tab>', ':bprevious<CR>')

nnoremap('<Leader>q', ':q<CR>')

nnoremap('gd', ':lua vim.lsp.buf.definition()<cr>')
nnoremap('gD', ':lua vim.lsp.buf.declaration()<cr>')
nnoremap('gi', ':lua vim.lsp.buf.implementation()<cr>')
nnoremap('gw', ':lua vim.lsp.buf.document_symbol()<cr>')
nnoremap('gw', ':lua vim.lsp.buf.workspace_symbol()<cr>')
nnoremap('gr', ':lua vim.lsp.buf.references()<cr>')
nnoremap('gt', ':lua vim.lsp.buf.type_definition()<cr>')
nnoremap('K', ':lua vim.lsp.buf.hover()<cr>')
nnoremap('<c-k>', ':lua vim.lsp.buf.signature_help()<cr>')
nnoremap('<leader>af', ':lua vim.lsp.buf.code_action()<cr>')
nnoremap('<leader>rn', ':lua vim.lsp.buf.rename()<cr>')
