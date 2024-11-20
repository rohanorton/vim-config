-- Keymap Modes:
-- 'n' = normal
-- 'i' = insert
-- 'c' = command
-- 's' = visual
-- 'x' = block
-- 'o' = operator pending
-- 't' = terminal
-- ''  = normal + visual/block + command
-- '!' = insert + command
-- 'v' = visual + block
SAFE_REQUIRE({
  "which-key",
  "refactoring",
  "telescope.builtin",
  "toggleterm.terminal",
  "pl.tablex",
  "mytime",
  "luasnip",
}, function(wk, refactoring, telescope_builtin, tt, tablex, mytime, luasnip)
  -- <Space> as Leader Key
  vim.keymap.set("", "<Space>", "<NOP>")
  vim.g.mapleader = " "

  -- Terminal Escape
  -- I really don't like this, but not sure what the best approach is :/
  wk.add({
    { "<esc><esc>", "<c-\\><c-n>", desc = "Normal Mode", mode = "t" },
  })

  -- J.K. for Esc/Save
  tablex.foreachi({ "jk", "kj" }, function(keys)
    wk.add({
      { keys, "<esc>", desc = "Escape", mode = { "i", "c", "v", "o" } },
      { keys, "<Cmd>write<CR>", desc = "Save File", mode = "n" },
      { "<leader>" .. keys, "<Cmd>write | source %<CR>", desc = "Save and Source File", mode = "n" },
    })
  end)

  -- wk.register({
  --   gq = { "<cmd>q<cr>", "Quit" },
  --   gqq = { "<cmd>q!<cr>", "No, really, quit!" },
  --   gqa = { "<cmd>qall<cr>", "Quit all" },
  --   gwa = { "<cmd>wall<cr>", "Write all" },
  --   gwq = { "<cmd>wq<cr>", "Write quit" },
  -- }, {
  --   mode = "n",
  -- })

  -- Replace <C-a> and <C-x> ... The former conflicts with tmux and I never rememeber the latter
  wk.add({
    { "+", "<Plug>SpeedDatingUp", desc = "Speed Dating Up", mode = { "x", "n" } },
    { "_", "<Plug>SpeedDatingDown", desc = "Speed Dating Down", mode = { "x", "n" } },
    { "<leader>+", "<Plug>SpeedDatingNowUTC", desc = "Speed Dating Now UTC" },
    { "<leader>_", "<Plug>SpeedDatingNowLocal", desc = "Speed Dating Now Local" },
  })

  -- Clear Highlights
  wk.add({
    { "<esc><esc>", "<cmd>nohlsearch<cr>", desc = "Clear Search Highlight" },
  })

  -- Paste over currently selected text without yanking it
  wk.add({
    { "p", '"_dP', desc = "Paste Without Yank", mode = "v" },
  })

  -- Buffers
  wk.add({
    { "<leader>b", "<Cmd>buffers<CR>", desc = "Buffer list" },
  })

  -- Recenter
  wk.add({
    { "<c-d>", "<c-d>zz", desc = "Centre on movement" },
    { "<c-u>", "<c-u>zz", desc = "Centre on movement" },
  })

  -- Go to last file
  wk.add({
    { "gl", "<c-^>", desc = "Goto last file" },
  })

  -- Move Line
  wk.add({
    { "K", ":move '<-2<CR>gv-gv", desc = "Move Line Up", mode = "v" },
    { "J", ":move '>+1<CR>gv-gv", desc = "Move Line Down", mode = "v" },
  })

  -- Telescope
  wk.add({
    { "<C-p>", telescope_builtin.find_files, desc = "Find File", mode = { "n", "c", "v" } },
  })

  wk.add({
    { "<leader>p", telescope_builtin.find_files, desc = "Find File" },
    {
      "<leader>v",
      function()
        telescope_builtin.find_files({ cwd = "/Users/rohan/.config/nvim" })
      end,
      desc = "Find Vim Config File",
    },
    { "<leader>f", telescope_builtin.live_grep, desc = "Live Grep" },
    { "<leader>b", telescope_builtin.buffers, desc = "Find Buffer" },
    { "<leader>h", telescope_builtin.help_tags, desc = "Find Help" },
    { "<leader>m", telescope_builtin.marks, desc = "Search Marks" },
    { "<leader>o", telescope_builtin.oldfiles, desc = "Old Files" },

    { "<leader>/", telescope_builtin.search_history, desc = "Search History" },
    { "<leader>#", telescope_builtin.grep_string, desc = "Search workspace for string under cursor" },
  })

  wk.add({
    { "<leader>a", ":Rg ", desc = "Rip Grep", mode = "n" },
  })

  -- LSP
  wk.add({
    { "gd", vim.lsp.buf.definition, desc = "Definition" },
    { "gD", vim.lsp.buf.declaration, desc = "Declaration" },
    { "gi", vim.lsp.buf.implemenation, desc = "Implemenation" },
    { "gw", vim.lsp.buf.document_symbol, desc = "Document Symbol" },
    { "gW", vim.lsp.buf.workspace_symbol, desc = "Workspace Symbol" },
    { "gr", vim.lsp.buf.references, desc = "References" },
    { "gt", vim.lsp.buf.type_definition, desc = "Type Definition" },
    { "gK", vim.lsp.buf.hover, desc = "Documentation" },
  })

  wk.add({
    { "<c-k>", vim.lsp.buf.signature_help, desc = "Signature Help" },
  })

  wk.add({
    { "<leader>e", vim.diagnostic.open_float, desc = "Open Floating Diagnostic Window" },
    { "<leader>d", vim.diagnostic.setloclist, desc = "Set Loc List" },
    { "<leader>af", vim.lsp.buf.code_action, desc = "Code Action" },
  })

  wk.add({
    { "cd", vim.lsp.buf.rename, desc = "Rename" },
    { "[d", vim.diagnostic.goto_prev, desc = "Goto Previous Diagnostic" },
    { "]d", vim.diagnostic.goto_next, desc = "Goto Next Diagnostic" },
  })

  -- Bufferline
  wk.add({
    { "<leader><leader>", "<Plug>buffting-open-menu", desc = "Open buffting menu" },
    { "<leader>0", "<Plug>buffting-jump-to-10", desc = "Jump to buffer 10" },
    { "<leader>1", "<Plug>buffting-jump-to-1", desc = "Jump to buffer 1" },
    { "<leader>2", "<Plug>buffting-jump-to-2", desc = "Jump to buffer 2" },
    { "<leader>3", "<Plug>buffting-jump-to-3", desc = "Jump to buffer 3" },
    { "<leader>4", "<Plug>buffting-jump-to-4", desc = "Jump to buffer 4" },
    { "<leader>5", "<Plug>buffting-jump-to-5", desc = "Jump to buffer 5" },
    { "<leader>6", "<Plug>buffting-jump-to-6", desc = "Jump to buffer 6" },
    { "<leader>7", "<Plug>buffting-jump-to-7", desc = "Jump to buffer 7" },
    { "<leader>8", "<Plug>buffting-jump-to-8", desc = "Jump to buffer 8" },
    { "<leader>9", "<Plug>buffting-jump-to-9", desc = "Jump to buffer 9" },
  })

  -- Close buffers
  wk.add({
    { "<leader>x", "<Cmd>BuffOnly<CR>", desc = "Close Other Buffers" },
    { "<leader>q", "<Cmd>bdelete<CR>", desc = "Close Buffer" },
  })

  -- Zoom Windows
  wk.add({
    { "<leader>z", "<Cmd>ZoomWinTabToggle<CR>", desc = "Zoom Window Toggle", mode = { "n", "c", "v" } },
  })

  wk.add({
    { "<S-Tab>", "<C-d>", desc = "De-Tab", mode = "i" },
  })

  -- Luasnips
  -- press <Tab> to expand or jump in a snippet. These can also be mapped separately
  -- via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
  wk.add({
    {
      mode = "i",
      {
        "<Tab>",
        function()
          if luasnip.expand_or_jumpable() then
            return "<Plug>luasnip-expand-or-jump"
          else
            return "<tab>"
          end
        end,
        desc = "Luasnip expand or jump",
        silent = true,
        expr = true,
      },
      {
        "<S-Tab>",
        function()
          if luasnip.jumpable(-1) then
            return "<Plug>luasnip-jump-prev"
          else
            return "<C-D>"
          end
        end,
        desc = "Luasnip Jump Previous",
        expr = true,
      },
      { "<c-l>", "<Plug>luasnip-jump-next", desc = "Luasnip Jump Next" },
      { "<c-j>", "<Plug>luasnip-jump-prev", desc = "Luasnip Jump Previous" },
      {
        "<c-e>",
        "luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'",
        desc = "Luasnip Next Choice",
        expr = true,
      },
    },
    {
      mode = "s",
      { "<c-l>", "<Plug>luasnip-jump-next", desc = "Luasnip Jump Next" },
      { "<c-j>", "<Plug>luasnip-jump-prev", desc = "Luasnip Jump Previous" },
      {
        "<S-Tab>",
        function()
          if luasnip.jumpable(-1) then
            return "<Plug>luasnip-jump-prev"
          else
            return "<C-D>"
          end
        end,
        desc = "Luasnip Jump Previous",
        expr = true,
      },
      -- For changing choices in choiceNodes (not strictly necessary for a basic setup).
      {
        "<c-e>",
        function()
          if luasnip.choice_active() then
            return "<Plug>luasnip-next-choice"
          else
            return "<C-E>"
          end
        end,
        desc = "Luasnip Next Choice",
        expr = true,
      },
    },
  })

  -- stylua: ignore start
  local extract_function = function() refactoring.refactor("Extract Function") end
  local extract_function_to_file = function() refactoring.refactor("Extract Function To File") end
  local extract_variable = function() refactoring.refactor("Extract Variable") end
  local inline_variable = function() refactoring.refactor("Inline Variable") end
  local extract_block = function() refactoring.refactor("Extract Block") end
  local extract_block_to_file = function() refactoring.refactor("Extract Block To File") end
  local select_refactoring = function() refactoring.select_refactor() end
  local debug_print_var_visual = function() refactoring.debug.print_var({}) end
  local debug_print_var_normal = function() refactoring.debug.print_var({normal = true}) end
  local debug_cleanup = function() refactoring.debug.cleanup({}) end
  -- stylua: ignore end

  -- Remaps for the refactoring operations currently offered by the plugin
  wk.add({
    {
      mode = "v",
      {
        { "<leader>re", extract_function, desc = "Extract Function" },
        { "<leader>rf", extract_function_to_file, desc = "Extract Function To File" },
        { "<leader>rv", extract_variable, desc = "Extract Variable" },
        { "<leader>ri", inline_variable, desc = "Inline Variable" },
        { "<leader>rr", select_refactoring, desc = "Select Refactoring" },
        { "<leader>rdv", debug_print_var_visual, desc = "Debug Print Variable" },
      },
    },
  })

  wk.add({
    {
      mode = "n",
      {
        -- Extract block doesn't need visual mode
        { "<leader>rb", extract_block, desc = "Extract Block" },
        { "<leader>rbf", extract_block_to_file, desc = "Extract Block To File" },
        -- Inline variable can also pick up the= { identifier currently under the cursor without visual mode
        { "<leader>ri", inline_variable, desc = "Inline Variable" },
        -- {"<leader>rn", ,desc= "Rename Variable" },
        { "<leader>rdv", debug_print_var_normal, desc = "Debug Print Variable" },
        { "<leader>rdc", debug_cleanup, desc = "Debug Print Cleanup" },
      },
    },
  })

  local lazygit = tt.Terminal:new({ cmd = "lazygit", direction = "float", hidden = true })

  local function lazygit_toggle()
    lazygit:toggle()
  end

  wk.add({
    { "<leader>g", lazygit_toggle, desc = "Lazy git" },
  })

  wk.add({
    {
      mode = "n",
      {
        { "<leader>ll", mytime.add_log, desc = "MyTime add log" },
        { "<leader>lr", mytime.read_log, desc = "MyTime read log" },
        { "<leader>le", mytime.edit_log, desc = "MyTime edit log" },
      },
    },
  })
end)
