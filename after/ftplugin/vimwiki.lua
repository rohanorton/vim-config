-- Vim Wiki was clobbering a keybinding I liked, so had to deactivate all the
-- header key bindings in order to set that binding to another here...

local key_opts = { silent = true, buffer = true }

-- Set usual default header bindings:
vim.keymap.set("n", "[[", "<Plug>VimwikiGoToPrevHeader", key_opts)
vim.keymap.set("n", "]]", "<Plug>VimwikiGoToNextHeader", key_opts)
vim.keymap.set("n", "[=", "<Plug>VimwikiGoToPrevSiblingHeader", key_opts)
vim.keymap.set("n", "]=", "<Plug>VimwikiGoToNextSiblingHeader", key_opts)
vim.keymap.set("n", "[u", "<Plug>VimwikiGoToParentHeader", key_opts)
vim.keymap.set("n", "]u", "<Plug>VimwikiGoToParentHeader", key_opts)

-- But change these ones:
vim.keymap.set("n", "<leader>-", "<Plug>VimwikiRemoveHeaderLevel", key_opts)
vim.keymap.set("n", "<leader>=", "<Plug>VimwikiAddHeaderLevel", key_opts)
