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
SAFE_REQUIRE(
  { "which-key", "refactoring", "telescope.builtin", "toggleterm.terminal", "pl.tablex", "mytime" },
  function(wk, refactoring, telescope_builtin, tt, tablex, mytime)
    -- <Space> as Leader Key
    vim.keymap.set("", "<Space>", "<NOP>")
    vim.g.mapleader = " "

    -- Terminal Escape
    -- I really don't like this, but not sure what the best approach is :/
    wk.register({
      ["<esc><esc>"] = { "<c-\\><c-n>", "Normal Mode" },
    }, { mode = "t" })

    -- J.K. for Esc/Save
    tablex.foreachi({ "jk", "kj" }, function(keys)
      tablex.foreachi({ "i", "c", "v", "o" }, function(mode)
        wk.register({
          [keys] = { "<esc>", "Escape" },
        }, { mode = mode })
      end)

      wk.register({
        [keys] = { "<Cmd>write<CR>", "Save File" },
      }, { mode = "n" })

      wk.register({
        [keys] = { "<Cmd>write | source %<CR>", "Save and Source File" },
      }, { mode = "n", prefix = "<leader>" })
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
    wk.register({
      ["+"] = { "<Plug>SpeedDatingUp", "Speed Dating Up" },
      ["_"] = { "<Plug>SpeedDatingDown", "Speed Dating Down" },
    }, {
      mode = "x",
    })
    wk.register({
      ["+"] = { "<Plug>SpeedDatingUp", "Speed Dating Up" },
      ["_"] = { "<Plug>SpeedDatingDown", "Speed Dating Down" },
    }, {
      mode = "n",
    })
    wk.register({
      ["+"] = { "<Plug>SpeedDatingNowUTC", "Speed Dating Now UTC" },
      ["_"] = { "<Plug>SpeedDatingNowLocal", "Speed Dating Now Local" },
    }, {
      prefix = "<leader>",
    })

    -- Clear Highlights
    wk.register({
      ["<esc><esc>"] = { "<cmd>nohlsearch<cr>", "Clear Search Highlight" },
    })

    -- Paste over currently selected text without yanking it
    wk.register({
      p = { '"_dP', "Paste Without Yank" },
    }, { mode = "v" })

    -- Buffers
    wk.register({
      b = { "<Cmd>buffers<CR>", "Buffer list" },
    }, {
      prefix = "<leader>",
    })

    -- Recenter
    wk.register({
      ["<c-d>"] = { "<c-d>zz", "Centre on movement" },
      ["<c-u>"] = { "<c-u>zz", "Centre on movement" },
    })

    -- Go to last file
    wk.register({
      g = {
        l = { "<c-^>", "Goto last file" },
      },
    })

    -- Move Line
    wk.register({
      K = { ":move '<-2<CR>gv-gv", "Move Line Up" },
      J = { ":move '>+1<CR>gv-gv", "Move Line Down" },
    }, { mode = "v" })

    -- Telescope
    wk.register({
      ["<C-p>"] = { telescope_builtin.find_files, "Find File" },
    }, { mode = "" })

    wk.register({
      p = { telescope_builtin.find_files, "Find File" },
      f = { telescope_builtin.live_grep, "Live Grep" },
      b = { telescope_builtin.buffers, "Find Buffer" },
      h = { telescope_builtin.help_tags, "Find Help" },
      m = { telescope_builtin.marks, "Search Marks" },
      o = { telescope_builtin.oldfiles, "Old Files" },

      ["/"] = { telescope_builtin.search_history, "Search History" },
      ["#"] = { telescope_builtin.grep_string, "Search workspace for string under cursor" },
    }, { prefix = "<leader>" })

    -- LSP
    wk.register({
      g = {
        d = { vim.lsp.buf.definition, "Definition" },
        D = { vim.lsp.buf.declaration, "Declaration" },
        i = { vim.lsp.buf.implemenation, "Implemenation" },
        w = { vim.lsp.buf.document_symbol, "Document Symbol" },
        W = { vim.lsp.buf.workspace_symbol, "Workspace Symbol" },
        r = { vim.lsp.buf.references, "References" },
        t = { vim.lsp.buf.type_definition, "Type Definition" },
        K = { vim.lsp.buf.hover, "Documentation" },
      },
    }, {})

    wk.register({
      ["<c-k>"] = { vim.lsp.buf.signature_help, "Signature Help" },
    })

    wk.register({
      e = { vim.diagnostic.open_float, "Open Floating Diagnostic Window" },
      d = { vim.diagnostic.setloclist, "Set Loc List" },
      af = { vim.lsp.buf.code_action, "Code Action" },
    }, { prefix = "<leader>" })

    wk.register({
      cd = { vim.lsp.buf.rename, "Rename" },
      ["[d"] = { vim.diagnostic.goto_prev, "Goto Previous Diagnostic" },
      ["]d"] = { vim.diagnostic.goto_next, "Goto Next Diagnostic" },
    })

    -- Bufferline
    wk.register({
      ["<leader>"] = { "<Plug>buffting-open-menu", "Open buffting menu" },
      ["0"] = { "<Plug>buffting-jump-to-10", "Jump to buffer 10" },
      ["1"] = { "<Plug>buffting-jump-to-1", "Jump to buffer 1" },
      ["2"] = { "<Plug>buffting-jump-to-2", "Jump to buffer 2" },
      ["3"] = { "<Plug>buffting-jump-to-3", "Jump to buffer 3" },
      ["4"] = { "<Plug>buffting-jump-to-4", "Jump to buffer 4" },
      ["5"] = { "<Plug>buffting-jump-to-5", "Jump to buffer 5" },
      ["6"] = { "<Plug>buffting-jump-to-6", "Jump to buffer 6" },
      ["7"] = { "<Plug>buffting-jump-to-7", "Jump to buffer 7" },
      ["8"] = { "<Plug>buffting-jump-to-8", "Jump to buffer 8" },
      ["9"] = { "<Plug>buffting-jump-to-9", "Jump to buffer 9" },
    }, {
      prefix = "<leader>",
    })

    -- Close buffers
    wk.register({
      x = { "<Cmd>BuffOnly<CR>", "Close Other Buffers" },
      q = { "<Cmd>bdelete<CR>", "Close Buffer" },
    }, {
      prefix = "<leader>",
    })

    -- Zoom Windows
    wk.register({
      z = { "<Cmd>ZoomWinTabToggle<CR>", "Zoom Window Toggle" },
    }, {
      mode = "",
      prefix = "<leader>",
    })

    wk.register({
      ["<S-Tab>"] = {
        "<C-d>",
        "De-Tab",
      },
    }, { mode = "i" })

    -- Luasnips
    -- press <Tab> to expand or jump in a snippet. These can also be mapped separately
    -- via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
    wk.register({
      ["<Tab>"] = {
        "luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'",
        "Luasnip expand or jump",
        expr = true,
      },
      ["<S-Tab>"] = {
        "luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<C-D>'",
        "Luasnip Jump Previous",
        expr = true,
      },
      ["<c-l>"] = { "<Plug>luasnip-jump-next", "Luasnip Jump Next" },
      ["<c-j>"] = { "<Plug>luasnip-jump-prev", "Luasnip Jump Previous" },
      ["<c-e>"] = {
        "luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'",
        "Luasnip Next Choice",
        expr = true,
      },
    }, { mode = "i" })

    wk.register({
      ["<c-l>"] = { "<Plug>luasnip-jump-next", "Luasnip Jump Next" },
      ["<c-j>"] = { "<Plug>luasnip-jump-prev", "Luasnip Jump Previous" },
      ["<S-Tab>"] = {
        "luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<C-D>'",
        "Luasnip Jump Previous",
        expr = true,
      },
      -- For changing choices in choiceNodes (not strictly necessary for a basic setup).
      ["<c-e>"] = {
        "luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'",
        "Luasnip Next Choice",
        expr = true,
      },
    }, { mode = "s" })

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
    wk.register({
      r = {
        e = { extract_function, "Extract Function" },
        f = { extract_function_to_file, "Extract Function To File" },
        v = { extract_variable, "Extract Variable" },
        i = { inline_variable, "Inline Variable" },
        r = { select_refactoring, "Select Refactoring" },
        dv = { debug_print_var_visual, "Debug Print Variable" },
      },
    }, {
      mode = "v",
      prefix = "<leader>",
    })

    wk.register({
      r = {
        -- Extract block doesn't need visual mode
        b = { extract_block, "Extract Block" },
        bf = { extract_block_to_file, "Extract Block To File" },
        -- Inline variable can also pick up the identifier currently under the cursor without visual mode
        i = { inline_variable, "Inline Variable" },
        n = { "Rename Variable" },
        dv = { debug_print_var_normal, "Debug Print Variable" },
        dc = { debug_cleanup, "Debug Print Cleanup" },
      },
    }, {
      mode = "n",
      prefix = "<leader>",
    })

    local lazygit = tt.Terminal:new({ cmd = "lazygit", direction = "float", hidden = true })

    local function lazygit_toggle()
      lazygit:toggle()
    end

    wk.register({
      g = { lazygit_toggle, "Lazy git" },
    }, {
      prefix = "<leader>",
    })

    wk.register({
      l = {
        l = { mytime.add_log, "MyTime add log" },
        r = { mytime.read_log, "MyTime read log" },
        e = { mytime.edit_log, "MyTime edit log" },
      },
    }, {
      mode = "n",
      prefix = "<leader>",
    })
  end
)
