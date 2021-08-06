-- Link: https://github.com/wbthomason/packer.nvim

-- vim.cmd [[packadd packer.nvim]]
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  execute 'packadd packer.nvim'
end

-- Auto compile when there are changes in plugins.lua
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'

-- require('packer').init({display = {non_interactive = true}})
require('packer').init({display = {auto_clean = false}})

return require('packer').startup(function(use)
  -- Packer can manage itself as an optional plugin
  use 'wbthomason/packer.nvim'

  -- Sensible settings
  use 'tpope/vim-sensible'

  -- Themes
  use 'rakr/vim-one'

  -- User interface
  use 'romgrk/barbar.nvim'
  use 'hoob3rt/lualine.nvim'
  use 'jeffkreeftmeijer/vim-numbertoggle'
  use 'folke/zen-mode.nvim'

  -- File icons
  use 'kyazdani42/nvim-web-devicons'

  -- Search
  use 'wincent/ferret'
  use 'kevinhwang91/nvim-hlslens'
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim'
    }
  }
  use 'nacro90/numb.nvim'

  -- Explorers
  use 'kyazdani42/nvim-tree.lua'

  -- Autocompletion
  use 'hrsh7th/nvim-compe'
  use 'jiangmiao/auto-pairs'
  use 'alvan/vim-closetag'

  -- Treesitter
  --- Dependencies: C++ compiler
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use {'p00f/nvim-ts-rainbow', requires = 'nvim-treesitter/nvim-treesitter'}
  use {'romgrk/nvim-treesitter-context', requires = 'nvim-treesitter/nvim-treesitter'}

  -- Snippets
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'

  -- Syntax
  --- Editor config
  use 'editorconfig/editorconfig-vim'
  --- Docker
  use 'ekalinin/Dockerfile.vim'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  }
  use 'kosayoda/nvim-lightbulb'

  -- Git
  use {
    'TimUntersberger/neogit',
    requires = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim'
    }
  }
  use {'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim'}


  -- General plugins
  use 'lukas-reineke/indent-blankline.nvim'
  use 'akinsho/nvim-toggleterm.lua'
  use 'tversteeg/registers.nvim'
  use 'ap/vim-buftabline'
  use 'tpope/vim-commentary'
  use 'tpope/vim-repeat'
  use 'airblade/vim-rooter'
  use 'mhinz/vim-startify'
  use 'tpope/vim-surround'

end)

