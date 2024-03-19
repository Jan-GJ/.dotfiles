local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim' --Packer default
	use 'folke/trouble.nvim'
	use 'stevearc/vim-arduino'
	use 'ellisonleao/gruvbox.nvim' --Gruvbox theme
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}                     --Lualine (stylelised bottom status bar)
	use 'tpope/vim-fugitive' --Vim-fugitive (git integration)
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	}                                  --Treesitter (Syntax highlighting)
	use 'nvim-treesitter/nvim-treesitter-context'
	use 'hiphish/rainbow-delimiters.nvim' --Rainbow-delimiters (Colored delimiters e.g (), [], {})
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}                                 --Telescope (Fuzzy file finder)
	use 'christoomey/vim-tmux-navigator' --Vim-tmux-navigator (vim keybinds with tmux)
	use 'norcalli/nvim-colorizer.lua' --Vim-colorizer-lua (colors #ff5532 accordingly)

	use({
		"iamcco/markdown-preview.nvim",
		run = function() vim.fn["mkdp#util#install"]() end,
	})

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			--LSP Support
			{ 'neovim/nvim-lspconfig' },
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'saadparwaiz1/cmp_luasnip' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-nvim-lua' },

			-- Snippets
			{ 'L3MON4D3/LuaSnip' },
			{ 'rafamadriz/friendly-snippets' },
		}
	}
	use 'windwp/nvim-ts-autotag' --Nvim-ts-autotag (Auto closing tags)
	use 'm4xshen/autoclose.nvim' --Autoclose.vim (Auto closes brackets etc)
	use 'github/copilot.vim'  --Github copilot

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)
