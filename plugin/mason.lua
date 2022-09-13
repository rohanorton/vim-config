SAFE_REQUIRE({ "mason" }, function(mason)
	mason.setup({
		max_concurrent_installers = 10,
		-- log_level = vim.log.levels.TRACE,
		ui = {
			icons = {
				package_installed = "",
				package_pending = "",
				package_uninstalled = "",
			},
		},
	})
end)
