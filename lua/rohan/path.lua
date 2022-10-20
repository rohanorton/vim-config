-- Absolute path to snippets.
local nvim_config_path = vim.env.HOME .. "/.config/nvim/?.lua"

package.path = table.concat({
  nvim_config_path,
  package.path,
}, ";")
