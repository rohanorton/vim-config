-- SAFE_REQUIRE is defined in globals, so have to use regular require
require("rohan.global")
SAFE_REQUIRE("impatient") -- Speed up lua load times
SAFE_REQUIRE("rohan.packer")
SAFE_REQUIRE("rohan.base")
SAFE_REQUIRE("rohan.keymaps")
SAFE_REQUIRE("rohan.lsp")
SAFE_REQUIRE("rohan.colorscheme")
SAFE_REQUIRE("rohan.autocmds")

if vim.g.neovide then
  SAFE_REQUIRE("rohan.neovide")
end
