SAFE_REQUIRE({ "alpha", "alpha.themes.startify" }, function(alpha, startify)
  startify.section.header = {
    type = "text",
    val = {
      [[                                                        neovim.  ]],
      [[  ,---,---,---,---,---,---,---,---,---,---,---,---,---,-------,  ]],
      [[  |esc| 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 0 | + | ' | <-    |  ]],
      [[  |---'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-----|  ]],
      [[  | ->| | Q | W | E | R | T | Y | U | I | O | P | ] | ^ |  ↵  |  ]],
      [[  |-----',--',--',--',--',--',--',--',--',--',--',--',--'|    |  ]],
      [[  | Caps | A | S | D | F | G | H | J | K | L | \ | [ | * |    |  ]],
      [[  |----,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'---'----|  ]],
      [[  |    | < | Z | X | C | V | B | N | M | , | . | - |          |  ]],
      [[  |----'-,-',--'--,'---'---'---'---'---'---'-,-'---',--,------|  ]],
      [[  | ctrl |  | alt |                          |altgr |  | ctrl |  ]],
      [[  '------'  '-----'--------------------------'------'  '------'  ]],
    },
    opts = {
      hl = "Type",
      shrink_margin = false,
      -- wrap = "overflow";
    },
  }
  startify.section.top_buttons = {
    type = "group",
    val = {
      startify.button("i", "New file", "<cmd>ene <CR>"),
    },
  }
  local config = {
    layout = {
      { type = "padding", val = 1 },
      startify.section.header,
      { type = "padding", val = 2 },
      startify.section.top_buttons,
      startify.section.mru_cwd,
      startify.section.mru,
      { type = "padding", val = 1 },
      startify.section.bottom_buttons,
      startify.section.footer,
    },
    opts = {
      margin = 3,
      redraw_on_resize = false,
      setup = function()
        vim.api.nvim_create_autocmd("DirChanged", {
          pattern = "*",
          callback = function()
            require("alpha").redraw()
          end,
        })
      end,
    },
  }

  alpha.setup(config)

  startify.section.bottom_buttons.val = {
    startify.button("v", "Neovim Config", ":e ~/.config/nvim/init.lua<cr>"),
    startify.button("q", "Quit", ":q<cr>"),
  }
end)
