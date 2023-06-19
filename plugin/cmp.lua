SAFE_REQUIRE(
  { "cmp", "luasnip", "lspkind", "nvim-autopairs.completion.cmp" },
  function(cmp, luasnip, lspkind, cmp_autopairs)
    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace }),
      }),
      sources = {
        { name = "copilot", group_index = 2 },
        { name = "nvim_lsp" },
        { name = "nvim_lsp_signature_help" },
        { name = "nvim_lua" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
        { name = "calc" },
        { name = "crates" },
      },
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = lspkind.cmp_format({
          mode = "symbol_text",
          maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
        }),
      },
    })

    -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    -- FIXME: Stopped working entirely D:
    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    -- cmp.setup.cmdline(":", {
    --   mapping = cmp.mapping.preset.cmdline(),
    --   sources = cmp.config.sources({
    --     { name = "path" },
    --   }, {
    --     { name = "cmdline" },
    --   }),
    -- })

    local autocmd = vim.api.nvim_create_autocmd
    local augroup = vim.api.nvim_create_augroup

    -- Formatting
    local sql_group = augroup("SqlGroup", { clear = true })
    autocmd("FileType", {
      pattern = "sql",
      command = "setlocal omnifunc=vim_dadbod_completion#omni",
      group = sql_group,
    })
    autocmd("FileType", {
      pattern = { "sql", "mysql", "plsql" },
      group = sql_group,
      callback = function()
        cmp.setup.buffer({ sources = { { name = "vim-dadbod-completion" } } })
      end,
    })

    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end
)
