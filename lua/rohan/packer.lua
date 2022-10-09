local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

SAFE_REQUIRE("packer", function(packer)
	packer.startup({

		function(use)
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

			-- Snippets
			use({
				"L3MON4D3/LuaSnip",
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
			use("windwp/nvim-autopairs")

			-- TPope plugins
			use({
				"tpope/vim-surround",
				"tpope/vim-repeat",
				"tpope/vim-unimpaired",
				"tpope/vim-abolish",
				"tpope/vim-endwise", -- Like autopairs but for ruby/lua blocks with "end"
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
			use({ "akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons" })
			use({ "numtostr/BufOnly.nvim" })

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

			use({
				"tpope/vim-dadbod",
				"kristijanhusak/vim-dadbod-ui",
				"kristijanhusak/vim-dadbod-completion",
			})

			-- Automatically set up your configuration after cloning packer.nvim
			if packer_bootstrap then
				packer.sync()
			end
		end,

		config = {
			-- Prevent sloooow packer window
			max_jobs = 5,
		},
	})
end)
