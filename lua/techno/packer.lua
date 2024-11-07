-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- the packer
	use 'wbthomason/packer.nvim'

    -- the theme
	use 'navarasu/onedark.nvim'

    -- file navigation
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use {
		"nvim-telescope/telescope-file-browser.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
	}

	use 'ThePrimeagen/harpoon'

    -- edit history
	use 'mbbill/undotree'
    
    -- git
    use 'lewis6991/gitsigns.nvim'
    --use 'tpope/vim-fugitive'
    use {
        "kdheepak/lazygit.nvim",
        requires = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("telescope").load_extension("lazygit")
        end,
    }

    -- syntax & analysis
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			--- Uncomment the two plugins below if you want to manage the language servers from neovim
			-- {'williamboman/mason.nvim'},
			-- {'williamboman/mason-lspconfig.nvim'},

			{'neovim/nvim-lspconfig'},
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
		}
	}
	use {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
	}
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

    -- completion framework
    use 'hrsh7th/nvim-cmp' 

    -- lsp completion source
    use 'hrsh7th/cmp-nvim-lsp'

    -- useful completion sources
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-vsnip'                             
    use 'hrsh7th/cmp-path'                              
    use 'hrsh7th/cmp-buffer'                            
    use 'hrsh7th/vim-vsnip'

    -- refactoring
    use 'nvim-treesitter/nvim-treesitter-refactor'

    -- QoL
    use 'lukas-reineke/indent-blankline.nvim' -- indent guides
    use 'windwp/nvim-autopairs' -- pair (), "", etc
    use 'RRethy/vim-illuminate' -- highlight words -- somehow works without require
    use {
        'kylechui/nvim-surround',
        tag = "*",
        config = function()
            require('nvim-surround').setup {}
        end
    }
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- language specific
    use 'simrat39/rust-tools.nvim'
end)
