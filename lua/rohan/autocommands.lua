vim.cmd [[augroup Autogroup]]

vim.cmd [[autocmd!]]

-- Auto-format all file formats before save
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_seq_sync(nil, 1000)]]

-- Run tests after save
-- vim.cmd [[autocmd BufWritePost * Ultest ]]

-- vim.cmd [[au TextYankPost * silent! lua vim.highlight.on_yank {higroup="HighlightedyankRegion"}]]

vim.cmd [[augroup END]]
