return {
  ["rust-analyzer"] = {
    lens = { enable = true },
    checkOnSave = { command = "clippy" },
    imports = {
      granularity = { group = "module" },
      prefix = "self",
    },
    cargo = {
      buildScripts = { enable = true },
    },
    procMacro = { enable = true },
  },
}
