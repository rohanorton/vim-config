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
local table = require("rohan.util.table")

local map = function(mode, lhs, rhs, ...)
  local opts = table.combine(...)
  return vim.keymap.set(mode, lhs, rhs, opts)
end

local silent = { silent = true }
local expr = { expr = true }
local noremap = { noremap = true }

-- <Space> as Leader Key
map("", "<Space>", "<NOP>")
vim.g.mapleader = " "

-- Terminal Escape
-- I really don't like this, but not sure what the best approach is :/
map("t", "<Esc><Esc>", "<C-\\><C-n>", noremap)

-- J.K. for Esc/Save
table.for_each(function(keystrokes)
  map({ "!", "v", "o", "t" }, keystrokes, "<Esc>", noremap)
  map("n", keystrokes, ":w<CR>", noremap, silent)

  -- Source file
  map("", "<leader>" .. keystrokes, "<Cmd>w<CR><Cmd>source %<CR>", silent)
end, { "jk", "kj" })

-- Replace <C-a> and <C-x> ... The former conflicts with tmux and I never rememeber the latter
map({ "n", "x" }, "+", "<Plug>SpeedDatingUp")
map({ "n", "x" }, "_", "<Plug>SpeedDatingDown")
map("n", "<leader>+", "<Plug>SpeedDatingNowUTC")
map("n", "<leader>_", "<Plug>SpeedDatingNowLocal")

-- Clear Highlights
map("n", "<Esc><Esc>", ":nohlsearch<CR>", silent)

-- Buffers
map("n", "<Leader>b", ":buffers<CR>", noremap)

-- Recenter
map("n", "<C-d>", "<C-d>zz", noremap)
map("n", "<C-u>", "<C-u>zz", noremap)

-- Go to last file
map("n", "gl", "<C-^>", noremap)

-- Move Line
map("v", "K", ":move '<-2<CR>gv-gv", noremap)
map("v", "J", ":move '>+1<CR>gv-gv", noremap)

-- Telescope
map("", "<C-p>", "<Cmd>Telescope find_files<CR>")

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
map("n", "<leader>0", "<Plug>buffting-jump-to-0", silent)
map("n", "<leader>1", "<Plug>buffting-jump-to-1", silent)
map("n", "<leader>2", "<Plug>buffting-jump-to-2", silent)
map("n", "<leader>3", "<Plug>buffting-jump-to-3", silent)
map("n", "<leader>4", "<Plug>buffting-jump-to-4", silent)
map("n", "<leader>5", "<Plug>buffting-jump-to-5", silent)
map("n", "<leader>6", "<Plug>buffting-jump-to-6", silent)
map("n", "<leader>7", "<Plug>buffting-jump-to-7", silent)
map("n", "<leader>8", "<Plug>buffting-jump-to-8", silent)
map("n", "<leader>9", "<Plug>buffting-jump-to-9", silent)
map("n", "<leader><leader>", "<Plug>buffting-open-menu", silent)

-- Close buffers
map("n", "<leader>x", "<Cmd>BufOnly<CR>", silent)
map("n", "<leader>q", "<Cmd>bdelete<CR>", silent)

-- Zoom Windows
map("", "<leader>z", "<Cmd>ZoomWinTabToggle<CR>", noremap)

SAFE_REQUIRE({ "luasnip" }, function(ls)
  -- Luasnips
  -- press <Tab> to expand or jump in a snippet. These can also be mapped separately
  -- via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
  map("i", "<Tab>", function()
    return ls.expand_or_jumpable() and "<Plug>luasnip-expand-or-jump" or "<Tab>"
  end, silent, expr)

  map({ "i", "s" }, "<C-l>", "<Plug>luasnip-jump-next", noremap, silent)
  map({ "i", "s" }, "<C-j>", "<Plug>luasnip-jump-prev", noremap, silent)

  -- For changing choices in choiceNodes (not strictly necessary for a basic setup).
  map({ "i", "s" }, "<C-e>", function()
    return ls.choice_active() and "<Plug>luasnip-next-choice" or "<C-E>"
  end, silent, expr)
end)
