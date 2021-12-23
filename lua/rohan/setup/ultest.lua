vim.g.ultest_use_pty = 1

vim.keymap.nmap {']t', '<Plug>(ultest-next-fail)'}
vim.keymap.nmap {'[t', '<Plug>(ultest-prev-fail)'}

vim.keymap.nnoremap {'<leader>t', ':Ultest<CR>'}

-- vim.api.nvim_exec([[
-- augroup UltestRunner
--     au!
--     au BufWritePost * Ultest
-- augroup END
-- ]], true)
