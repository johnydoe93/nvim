-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- use({ 'rose-pine/neovim' })
  -- use('Mofiqul/vscode.nvim')
  -- use('martinsione/darkplus.nvim')
  -- use("lunarvim/darkplus.nvim")

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('mhinz/vim-signify')
  use('tpope/vim-rhubarb')
  use('junegunn/gv.vim')

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},             -- Required
		  {'williamboman/mason.nvim'},           -- Optional
		  {'williamboman/mason-lspconfig.nvim'}, -- Optional

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},         -- Required
		  {'hrsh7th/cmp-nvim-lsp'},     -- Required
		  {'hrsh7th/cmp-buffer'},       -- Optional
          {'hrsh7th/cmp-path'},         -- Optional
          {'saadparwaiz1/cmp_luasnip'}, -- Optional
		  {'hrsh7th/cmp-nvim-lua'},     -- Optional

          -- Snippets
          {'L3MON4D3/LuaSnip'},             -- Required
          {'rafamadriz/friendly-snippets'}, -- Optional
      }
  }
  use { "github/copilot.vim" }
  use { "vim-test/vim-test" }
  -- use { "airblade/vim-gitgutter" }
  use { "EdenEast/nightfox.nvim" }
  use { 'mhartington/oceanic-next' }
  -- use { "Mofiqul/vscode.nvim" }
  -- use { 'tomasiser/vim-code-dark' }
  use { 'nvim-tree/nvim-web-devicons' }
  use {
      'nvim-tree/nvim-tree.lua',
      requires = {
          'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  use { 'moll/vim-bbye' }

  use { 'nanozuki/tabby.nvim' }
  use { 'f-person/git-blame.nvim' }
  use { 'tpope/vim-surround' }
  use { 'jgdavey/vim-blockle' }
  use { 'AndrewRadev/switch.vim' }
  use { 'AdamWhittingham/vim-copy-filename' }
  use {
      "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
  }
  use { 'preservim/nerdcommenter' }
  use { 'bogado/file-line' }
end)
