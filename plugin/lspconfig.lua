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

  lspconfig["tsserver"].setup({
    on_attach = on_attach,
    flags = lsp_flags,
  })

  lspconfig["elmls"].setup({
    on_attach = on_attach,
    flags = lsp_flags,
  })

  lspconfig["pyright"].setup({
    on_attach = on_attach,
    flags = lsp_flags,
  })

  lspconfig["angularls"].setup({
    on_attach = on_attach,
    flags = lsp_flags,
  })
end)
