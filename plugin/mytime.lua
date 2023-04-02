SAFE_REQUIRE({ "mytime" }, function(mytime)
  mytime.setup({
    directory = vim.fn.resolve(os.getenv("HOME") .. "/Dropbox/rohan"),
  })
end)
