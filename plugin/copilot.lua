SAFE_REQUIRE({ "copilot", "copilot_cmp" }, function(copilot, copilot_cmp)
  copilot.setup({
    {
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
    filetypes = {
      yaml = false,
      markdown = false,
      help = false,
      gitcommit = false,
      gitrebase = false,
      hgcommit = false,
      svn = false,
      cvs = false,
      ["."] = false,
    },
    copilot_node_command = "node", -- Node.js version must be > 16.x
    server_opts_overrides = {},
  })
  copilot_cmp.setup()
end)
