-- Close buffer using q
vim.keymap.set("n", "q", "<Cmd>bdelete<CR>", { buffer = true })

-- Start help in fullscreen buffer.
-- FIXME: If you are already in a zoomed buffer, this errors. Not sure what the
--        best approach to fixing this is, so just moving this to the end of
--        the file so that when it fails it doesn't break the rest of the
--        config
vim.cmd("ZoomWinTabIn")
