SAFE_REQUIRE({ "lspconfig" }, function(lspconfig)
  local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
  }

  local on_attach = require("rohan.lsp.on-attach")

  lspconfig["lua_ls"].setup({
    on_attach = on_attach,
    flags = lsp_flags,
    settings = require("rohan.lsp.settings.lua_ls"),
  })

  lspconfig["taplo"].setup({
    on_attach = on_attach,
    flags = lsp_flags,
  })

  lspconfig["ts_ls"].setup({
    on_attach = function(client, bufnr)
      require("twoslash-queries").attach(client, bufnr)
      on_attach(client, bufnr)
    end,
    flags = lsp_flags,
  })

  lspconfig["elmls"].setup({
    on_attach = on_attach,
    flags = lsp_flags,
  })

  lspconfig["pyright"].setup({
    on_attach = on_attach,
    flags = lsp_flags,
    settings = {
      pyright = { autoImportCompletion = true },
      python = {
        analysis = {
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
        },
      },
    },
  })

  lspconfig["angularls"].setup({
    on_attach = on_attach,
    flags = lsp_flags,
  })

  lspconfig["omnisharp"].setup({
    cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },

    on_attach = function(client, bufnr)
      print("Hello from OmniSharp!")
      on_attach(client, bufnr)
    end,

    -- Enables support for reading code style, naming convention and analyzer
    -- settings from .editorconfig.
    enable_editorconfig_support = true,

    -- If true, MSBuild project system will only load projects for files that
    -- were opened in the editor. This setting is useful for big C# codebases
    -- and allows for faster initialization of code navigation features only
    -- for projects that are relevant to code that is being edited. With this
    -- setting enabled OmniSharp may load fewer projects and may thus display
    -- incomplete reference lists for symbols.
    enable_ms_build_load_projects_on_demand = false,

    -- Enables support for roslyn analyzers, code fixes and rulesets.
    enable_roslyn_analyzers = false,

    -- Specifies whether 'using' directives should be grouped and sorted during
    -- document formatting.
    organize_imports_on_format = true,

    -- Enables support for showing unimported types and unimported extension
    -- methods in completion lists. When committed, the appropriate using
    -- directive will be added at the top of the current file. This option can
    -- have a negative impact on initial completion responsiveness,
    -- particularly for the first few completion sessions after opening a
    -- solution.
    enable_import_completion = true,

    -- Specifies whether to include preview versions of the .NET SDK when
    -- determining which version to use for project loading.
    sdk_include_prereleases = true,

    -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
    -- true
    analyze_open_documents_only = false,

    flags = lsp_flags,
  })
end)
