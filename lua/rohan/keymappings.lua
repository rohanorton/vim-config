-- Helper functions
local imap = vim.keymap.imap
local smap = vim.keymap.smap
local nmap = vim.keymap.nmap
local xmap = vim.keymap.xmap
local nnoremap = vim.keymap.nnoremap
local inoremap = vim.keymap.inoremap
local xnoremap = vim.keymap.xnoremap
--

-- <Space> as Leader Key
nnoremap {'<Space>', '<NOP>'}
vim.g.mapleader = ' '

-- J.K.
inoremap {'kj', '<Esc>'}
inoremap {'jk', '<Esc>'}

nnoremap {'kj', ':w<CR>'}
nnoremap {'jk', ':w<CR>'}

-- Clear Highlights
nnoremap {'<Esc><Esc>', ':nohlsearch<CR>'}

-- Buffers
nnoremap {'<Leader>b', ':buffers<CR>'}

-- Go to last file
nnoremap {'gl', '<C-^>'}

-- Move
xnoremap {'K', ':move \'<-2<CR>gv-gv'}
xnoremap {'J', ':move \'>+1<CR>gv-gv'}

-- Telescope
nnoremap {'<C-p>', '<Cmd>Telescope find_files<CR>'}
nnoremap {'<Leader>p', '<Cmd>Telescope find_files<CR>'}

nnoremap {'<Leader>a', '<Cmd>Telescope live_grep<CR>'}
nnoremap {'<Leader>/', '<Cmd>Telescope live_grep<CR>'}

nnoremap {'<Leader>b', '<Cmd>Telescope buffers<CR>'}

nnoremap {'<Leader>h', '<Cmd>Telescope help_tags<CR>'}

-- Buffers
nnoremap {'<Leader><Tab>', ':bnext<CR>'}
nnoremap {'<Leader><S-Tab>', ':bprevious<CR>'}

nnoremap {'<Leader>q', ':q<CR>'}

nnoremap {'gd', vim.lsp.buf.definition}
nnoremap {'gD', vim.lsp.buf.declaration}
nnoremap {'gi', vim.lsp.buf.implementation}
nnoremap {'gw', vim.lsp.buf.document_symbol}
nnoremap {'gw', vim.lsp.buf.workspace_symbol}
nnoremap {'gr', vim.lsp.buf.references}
nnoremap {'gt', vim.lsp.buf.type_definition}
nnoremap {'K', vim.lsp.buf.hover}
nnoremap {'<c-k>', vim.lsp.buf.signature_help}
nnoremap {'<leader>af', vim.lsp.buf.code_action}
nnoremap {'cd', vim.lsp.buf.rename}

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
    imap {x.key, rhs, expr = true}
    smap {x.key, rhs, expr = true}
end

-- Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
nmap {'s', '<Plug>(vsnip-select-text)'}
xmap {'s', '<Plug>(vsnip-select-text)'}
nmap {'s', '<Plug>(vsnip-cut-text)'}
xmap {'s', '<Plug>(vsnip-cut-text)'}

nmap {'<leader>t', ':TestNearest<CR>'}
nmap {'<leader>T', ':TestFile<CR>'}
nmap {'<leader>a', ':TestSuite<CR>'}
nmap {'<leader>l', ':TestLast<CR>'}
nmap {'<leader>g', ':TestVisit<CR>'}
