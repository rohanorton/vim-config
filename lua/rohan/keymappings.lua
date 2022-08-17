-- Helper functions
local imap = function(lhs, rhs, opts)
    vim.keymap.set('i', lhs, rhs, opts)
end
local smap = function(lhs, rhs, opts)
    vim.keymap.set('s', lhs, rhs, opts)
end
local nmap = function(lhs, rhs, opts)
    vim.keymap.set('n', lhs, rhs, opts)
end
local xmap = function(lhs, rhs, opts)
    vim.keymap.set('x', lhs, rhs, opts)
end
local nnoremap = function(lhs, rhs, opts)
    if opts == nil then opts = {} end
    opts.noremap = true
    vim.keymap.set('n', lhs, rhs, opts)
end
local inoremap = function(lhs, rhs, opts)
    if opts == nil then opts = {} end
    opts.noremap = true
    vim.keymap.set('i', lhs, rhs, opts)
end
local xnoremap = function(lhs, rhs, opts)
    if opts == nil then opts = {} end
    opts.noremap = true
    vim.keymap.set('x', lhs, rhs, opts)
end
--

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

nnoremap('gd', vim.lsp.buf.definition)
nnoremap('gD', vim.lsp.buf.declaration)
nnoremap('gi', vim.lsp.buf.implementation)
nnoremap('gw', vim.lsp.buf.document_symbol)
nnoremap('gw', vim.lsp.buf.workspace_symbol)
nnoremap('gr', vim.lsp.buf.references)
nnoremap('gt', vim.lsp.buf.type_definition)
nnoremap('K', vim.lsp.buf.hover)
nnoremap('<c-k>', vim.lsp.buf.signature_help)
nnoremap('<leader>af', vim.lsp.buf.code_action)
nnoremap('cd', vim.lsp.buf.rename)

local vsnip_bindings = {
    {
        -- Expand
        key = '<C-j>',
        condition = 'vsnip#expandable()',
        command = '<Plug>(vsnip-expand)'
    }, {
        -- Expand or jump
        key = '<C-l>',
        condition = 'vsnip#available(1)',
        command = '<Plug>(vsnip-expand-or-jump)'
    }, {
        -- Jump forward
        key = '<Tab>',
        condition = 'vsnip#jumpable(1)',
        command = '<Plug>(vsnip-jump-next)'
    }, {
        -- Jump backward
        key = '<S-Tab>',
        condition = 'vsnip#jumpable(-1)',
        command = '<Plug>(vsnip-jump-prev)'
    }
}

for _, x in pairs(vsnip_bindings) do
    -- e.g. "vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)': '<C-l>'"
    local rhs = x.condition .. " ? '" .. x.command .. "' : '" .. x.key .. "'"
    opts = { expr = true }
    imap(x.key, rhs, opts)
    smap(x.key, rhs, opts)
end

-- Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
nmap('s', '<Plug>(vsnip-select-text)')
xmap('s', '<Plug>(vsnip-select-text)')
nmap('s', '<Plug>(vsnip-cut-text)')
xmap('s', '<Plug>(vsnip-cut-text)')

nnoremap('<leader>t', ':TestNearest<CR>')
-- nnoremap('<leader>t', ':Ultest<CR>')
nnoremap('<leader>tf', ':TestFile<CR>')
nnoremap('<leader>t', ':TestSuite<CR>')
nnoremap('<leader>tl', ':TestLast<CR>')
nnoremap('<leader>tg', ':TestVisit<CR>')

-- nnoremap(']t', '<Plug>(ultest-next-fail)')
-- nnoremap('[t', '<Plug>(ultest-prev-fail)')

-- nnoremap(
--     ']c',
--     function() require("trouble").next({skip_groups = true, jump = true}) end
-- );
-- nnoremap(
--     '[c',
--     function() require("trouble").previous({skip_groups = true, jump = true}) end
-- );
