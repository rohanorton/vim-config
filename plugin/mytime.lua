SAFE_REQUIRE({ "mytime" }, function(mytime)
  mytime.setup({
    directory = vim.fn.resolve(
      os.getenv("HOME") .. "/Library/Mobile Documents/com~apple~CloudDocs/Documents/Obsidian/rohan"
    ),
  })
end)
