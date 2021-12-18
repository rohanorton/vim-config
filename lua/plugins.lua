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
    return string.format("require(\"rohan/%s\")", name)
end

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {"npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}

    use {
        'nvim-telescope/telescope.nvim',
        requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'}
    }

    use {'mhartington/formatter.nvim', config = get_config('formatter')}

    use {
        'williamboman/nvim-lsp-installer',
        config = get_config('lsp-installer')
    }

    use 'neovim/nvim-lspconfig'

    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline', 'hrsh7th/cmp-calc', 'hrsh7th/cmp-nvim-lua'
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
end)
