vim.opt_local.suffixesadd:prepend('.lua')
vim.opt_local.suffixesadd:prepend('init.lua')
-- Allows `gf` to work for vim config require
-- TODO: this should probably be changed so that it's only added if the file
-- itself is in the vim config directory
vim.opt_local.path:prepend(vim.fn.stdpath('config') .. '/lua')
