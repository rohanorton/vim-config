local path_exists = function(path)
  return vim.fn.empty(vim.fn.glob(path)) == 0
end

local ensure_packer = function()
  local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if path_exists(install_path) then
    return false
  end
  vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
  vim.cmd("packadd packer.nvim")
  return true
end

local packer_bootstrap = ensure_packer()

SAFE_REQUIRE({ "packer", "packer.luarocks" }, function(packer, luarocks)
  packer.startup({

    function(use)
      local function use_local_or_fallback(local_addr, repo)
        -- Check if local repo exists
        if path_exists(local_addr) then
          use(local_addr)
        -- Otherwise use github repo
        else
          use(repo)
        end
      end

      -- Packer can manage itself
      use("wbthomason/packer.nvim")

      -- Speed up loading Lua modules in Neovim to improve startup time.
      use("lewis6991/impatient.nvim")

      -- Colorschemes
      use("ellisonleao/gruvbox.nvim")

      -- Statusline
      use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
      })

      -- Kind Symbols
      use("onsails/lspkind.nvim")

      -- Telescope
      use({
        "nvim-telescope/telescope.nvim",
        requires = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },
      })

      -- LSP
      use({
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim", -- Installer
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "jose-elias-alvarez/null-ls.nvim", -- Make vim a language server
        "simrat39/rust-tools.nvim",
      })

      -- LSP Loader
      use({ "j-hui/fidget.nvim", tag = "legacy" })

      -- Snippets
      use({
        { "L3MON4D3/LuaSnip", run = "make install_jsregexp" },
        "rafamadriz/friendly-snippets",
      })

      -- Rust
      use({
        "saecki/crates.nvim",
        requires = { "nvim-lua/plenary.nvim" },
      })

      -- Cmp
      use({
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-calc",
        "saadparwaiz1/cmp_luasnip",
      })
      use({
        "zbirenbaum/copilot.lua",
        "zbirenbaum/copilot-cmp",
      })

      -- Treesitter
      use({
        "nvim-treesitter/nvim-treesitter",
        "nvim-treesitter/playground",
        "nvim-treesitter/nvim-treesitter-textobjects",
      })

      -- Git
      use({ "lewis6991/gitsigns.nvim" })

      -- Editable Directory Buffer
      -- (vim-vinegar replacement)
      use("elihunter173/dirbuf.nvim")

      -- Autopairs
      use({
        "windwp/nvim-autopairs",
        "RRethy/nvim-treesitter-endwise",
        "windwp/nvim-ts-autotag",
      })

      -- TPope plugins
      use({
        "tpope/vim-surround",
        "tpope/vim-repeat",
        "tpope/vim-unimpaired",
        "tpope/vim-abolish",
        "tpope/vim-fugitive",
        "tpope/vim-speeddating",
      })

      -- Comments
      use("numToStr/Comment.nvim")

      -- Todo Comment Highlighting
      use({
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
      })

      -- Start Screen
      use({
        "goolord/alpha-nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
      })

      -- Buffers
      use({ "akinsho/bufferline.nvim", tag = "*", requires = "kyazdani42/nvim-web-devicons" })
      use({ "numtostr/BufOnly.nvim" })

      -- Marks
      use("chentoast/marks.nvim")

      -- Highlight instances of word under cursor
      use("RRethy/vim-illuminate")

      -- Zoom split windows
      use("troydm/zoomwintab.vim")

      -- Scratchpad for Lua
      use({ "rafcamlet/nvim-luapad", requires = "antoinemadec/FixCursorHold.nvim" })

      -- Testing
      use({
        "nvim-neotest/neotest",
        requires = {
          "nvim-lua/plenary.nvim",
          "nvim-treesitter/nvim-treesitter",
          "antoinemadec/FixCursorHold.nvim",
          "vim-test/vim-test",
          "nvim-neotest/neotest-vim-test",
          "nvim-neotest/neotest-plenary",

          -- Test Adapters
          "haydenmeade/neotest-jest",
        },
      })
      use("andythigpen/nvim-coverage")

      -- Refactoring
      use({
        "ThePrimeagen/refactoring.nvim",
        requires = {
          { "nvim-lua/plenary.nvim" },
          { "nvim-treesitter/nvim-treesitter" },
        },
      })

      -- Database
      use({
        "tpope/vim-dadbod",
        "kristijanhusak/vim-dadbod-ui",
        "kristijanhusak/vim-dadbod-completion",
      })

      use("folke/which-key.nvim")
      -- Read RFCs
      use("mhinz/vim-rfc")

      -- Nvim Plugin Developement
      use("folke/lua-dev.nvim")

      -- Trouble
      use("folke/trouble.nvim")

      -- Terminal
      use("akinsho/toggleterm.nvim")

      -- Hex
      use("fidian/hexmode")

      -- Colors
      use("norcalli/nvim-colorizer.lua")

      -- Editor Config
      use("gpanders/editorconfig.nvim")

      -- Prevent Vim Inception in Terminal
      use("samjwill/nvim-unception")

      -- Fuzzy Finder
      use({ "junegunn/fzf", run = ":call fzf#install()" })
      use("junegunn/fzf.vim")

      use("mtdl9/vim-log-highlighting")

      -- Typescript type checking
      use("marilari88/twoslash-queries.nvim")

      -- Vim in the browser@
      use({
        "glacambre/firenvim",
        run = function()
          vim.fn["firenvim#install"](0)
        end,
      })

      use({
        "rest-nvim/rest.nvim",
        rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" },
        requires = { "nvim-lua/plenary.nvim" },
      })

      use({ "echasnovski/mini.nvim" })

      -- My Plugins...
      use_local_or_fallback("~/Code/rohanorton/buffting.nvim", "rohanorton/buffting.nvim")
      use_local_or_fallback("~/Code/rohanorton/lua-gf.nvim", "rohanorton/lua-gf.nvim")
      use_local_or_fallback("~/Code/rohanorton/mytime.nvim", "rohanorton/mytime.nvim")

      packer.use_rocks("penlight")
      luarocks.setup_paths()

      -- Automatically set up your configuration after cloning packer.nvim
      if packer_bootstrap then
        packer.sync()
      end
    end,

    config = {
      -- Prevent sloooow packer window
      max_jobs = 5,
      luarocks = {
        python_cmd = "python", -- Set the python command to use for running hererocks
      },
      log = { level = "info" }, -- The default print log level. One of: "trace", "debug", "info", "warn", "error", "fatal".
    },
  })
end)
