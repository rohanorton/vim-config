local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
        'git', 'clone', 'https://github.com/wbthomason/packer.nvim',
        install_path
    })
    vim.api.nvim_command('packadd packer.nvim')
end

-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
local function get_config(name)
    return string.format("require(\"rohan/setup/%s\")", name)
end

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'tjdevries/astronauta.nvim'

    use {"npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}

    use {
        'nvim-telescope/telescope.nvim',
        requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'},
        config = get_config('telescope')
    }

    use {'nvim-telescope/telescope-cheat.nvim', requires = {'tami5/sqlite.lua'}}

    use {
        "nvim-telescope/telescope-frecency.nvim",
        requires = {"tami5/sqlite.lua"},
        config = get_config('telescope-frecency')
    }

    use 'neovim/nvim-lspconfig'

    use 'williamboman/nvim-lsp-installer'

    use {'hrsh7th/vim-vsnip', requires = {'rafamadriz/friendly-snippets'}}

    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline', 'hrsh7th/cmp-calc', 'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-vsnip'
        },
        config = get_config('cmp')
    }

    use 'tpope/vim-vinegar'

    use {
        'goolord/alpha-nvim',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = get_config('alpha')
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        requires = {"nvim-treesitter/playground"},
        config = get_config('treesitter')
    }

    use {
        'tpope/vim-commentary',
        requires = {'JoosepAlviste/nvim-ts-context-commentstring'}
    }

    use 'google/vim-searchindex'

    use {"AndrewRadev/splitjoin.vim", keys = {"gJ", "gS"}}

    use 'tpope/vim-fugitive'

    use 'tpope/vim-repeat'

    use 'tpope/vim-surround'

    use 'tpope/vim-unimpaired'

    use 'tpope/vim-abolish'

    use {'simrat39/rust-tools.nvim', config = get_config('rust-tools')}

    use {"elzr/vim-json", ft = "json"}

    use "justinmk/vim-syntax-extra"

    use "lewis6991/gitsigns.nvim"

    -- use {
    --     "rcarriga/vim-ultest",
    --     config = get_config('ultest'),
    --     requires = {"vim-test/vim-test"},
    --     run = ":UpdateRemotePlugins"
    -- }

    use "ThePrimeagen/harpoon"

    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = get_config('trouble')

    }

    use {
        'machakann/vim-highlightedyank',
        config = get_config('highlightedyank')
    }
end)
