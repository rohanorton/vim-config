local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	vim.api.nvim_command("packadd packer.nvim")
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Install your plugins here
return packer.startup({
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
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
		})

		-- Kind Symbols
		use("onsails/lspkind.nvim")

		-- Telescope
		use({
			{
				"nvim-telescope/telescope.nvim",
				requires = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },
			},
			{
				"nvim-telescope/telescope-frecency.nvim",
				requires = { "tami5/sqlite.lua" },
			},
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

		-- Automatically set up your configuration after cloning packer.nvim
		if PACKER_BOOTSTRAP then
			require("packer").sync()
		end
	end,
	config = {
		-- Prevent sloooow packer window
		max_jobs = 5,
	},
})
