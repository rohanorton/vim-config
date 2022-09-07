-- Keymap Modes:
-- 'n' = normal
-- 'i' = insert
-- 'c' = command
-- 's' = visual
-- 'x' = block
-- 'o' = operator pending
-- 't' = terminal
-- ''  = normal + visual/block + command
-- '!' = insert + command
-- 'v' = visual + block

local map = vim.keymap.set
local silent = { silent = true }
local noremap = { noremap = true }

-- <Space> as Leader Key
map("", "<Space>", "<NOP>")
vim.g.mapleader = " "

-- Source file
map("", "<leader>sf", "<Cmd>:source %<CR>", silent)

-- J.K. for Esc/Save
for _, keystrokes in pairs({ "jk", "kj" }) do
	map({ "!", "v", "o", "t" }, keystrokes, "<Esc>", noremap)
	map("n", keystrokes, ":w<CR>", noremap)
end

-- Clear Highlights
map("n", "<Esc><Esc>", ":nohlsearch<CR>", silent)

-- Buffers
map("n", "<Leader>b", ":buffers<CR>", noremap)

-- Go to last file
map("n", "gl", "<C-^>", noremap)

-- Move Line
map("v", "K", ":move '<-2<CR>gv-gv", noremap)
map("v", "J", ":move '>+1<CR>gv-gv", noremap)

-- Telescope
map("", "<C-p>", "<Cmd>Telescope find_files<CR>")
map(
	"n",
	"<leader><leader>",
	"<Cmd>lua require('telescope').extensions.frecency.frecency({ workspace = 'CWD' })<CR>",
	{ noremap = true, silent = true }
)

map("n", "<Leader>p", "<Cmd>Telescope find_files<CR>")

map("n", "<Leader>a", "<Cmd>Telescope live_grep<CR>")
map("n", "<Leader>/", "<Cmd>Telescope live_grep<CR>")

map("n", "<Leader>b", "<Cmd>Telescope buffers<CR>")

map("n", "<Leader>h", "<Cmd>Telescope help_tags<CR>")

-- LSP
map("n", "gd", vim.lsp.buf.definition, silent)
map("n", "gD", vim.lsp.buf.declaration, silent)
map("n", "gi", vim.lsp.buf.implementation, silent)
map("n", "gw", vim.lsp.buf.document_symbol, silent)
map("n", "gw", vim.lsp.buf.workspace_symbol, silent)
map("n", "gr", vim.lsp.buf.references, silent)
map("n", "gt", vim.lsp.buf.type_definition, silent)
map("n", "K", vim.lsp.buf.hover, silent)
map("n", "<c-k>", vim.lsp.buf.signature_help, silent)
map("n", "<leader>af", vim.lsp.buf.code_action, silent)
map("n", "cd", vim.lsp.buf.rename, silent)

map("n", "<leader>e", vim.diagnostic.open_float, silent)
map("n", "[d", vim.diagnostic.goto_prev, silent)
map("n", "]d", vim.diagnostic.goto_next, silent)
map("n", "<leader>d", vim.diagnostic.setloclist, silent)

-- Bufferline
map("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", silent)
map("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", silent)
map("n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", silent)
map("n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", silent)
map("n", "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", silent)
map("n", "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>", silent)
map("n", "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>", silent)
map("n", "<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>", silent)
map("n", "<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>", silent)

-- Close buffers
map("n", "<leader>x", "<Cmd>BufOnly<CR>", silent)
map("n", "<leader>q", "<Cmd>bdelete<CR>", silent)

-- Zoom Windows
map("", "<leader>z", "<Cmd>ZoomWinTabToggle<CR>", noremap)
