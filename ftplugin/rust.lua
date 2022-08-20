-- Rust specific keybindings
local map = vim.keymap.set
local key_opts = { silent = true }

map("n", "<leader>rh", "<cmd>RustSetInlayHints<Cr>", key_opts)
map("n", "<leader>rhd", "<cmd>RustDisableInlayHints<Cr>", key_opts)
map("n", "<leader>th", "<cmd>RustToggleInlayHints<Cr>", key_opts)
map("n", "<leader>rr", "<cmd>RustRunnables<Cr>", key_opts)
map("n", "<leader>rem", "<cmd>RustExpandMacro<Cr>", key_opts)
map("n", "<leader>roc", "<cmd>RustOpenCargo<Cr>", key_opts)
map("n", "<leader>rpm", "<cmd>RustParentModule<Cr>", key_opts)
map("n", "<leader>rjl", "<cmd>RustJoinLines<Cr>", key_opts)
map("n", "<leader>rha", "<cmd>RustHoverActions<Cr>", key_opts)
map("n", "<leader>rhr", "<cmd>RustHoverRange<Cr>", key_opts)
map("n", "<leader>rmd", "<cmd>RustMoveItemDown<Cr>", key_opts)
map("n", "<leader>rmu", "<cmd>RustMoveItemUp<Cr>", key_opts)
map("n", "<leader>rsb", "<cmd>RustStartStandaloneServerForBuffer<Cr>", key_opts)
map("n", "<leader>rd", "<cmd>RustDebuggables<Cr>", key_opts)
map("n", "<leader>rv", "<cmd>RustViewCrateGraph<Cr>", key_opts)
map("n", "<leader>rw", "<cmd>RustReloadWorkspace<Cr>", key_opts)
map("n", "<leader>rss", "<cmd>RustSSR<Cr>", key_opts)
map("n", "<leader>rxd", "<cmd>RustOpenExternalDocs<Cr>", key_opts)
