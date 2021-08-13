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
  use 'sainnhe/edge'

  -- User interface
  use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons'}
  use {'hoob3rt/lualine.nvim', requires = 'nvim-lua/lsp-status.nvim'}
  use 'jeffkreeftmeijer/vim-numbertoggle'
  use 'folke/zen-mode.nvim'

  -- File icons
  use 'kyazdani42/nvim-web-devicons'

  -- Search
  use 'wincent/ferret'
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim'
    }
  }
  use 'nacro90/numb.nvim'
  use 'kevinhwang91/nvim-bqf'

  -- Explorers
  use 'kyazdani42/nvim-tree.lua'

  -- Autocompletion
  use 'hrsh7th/nvim-compe'

  -- Treesitter
  --- Dependencies: C++ compiler
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use {'p00f/nvim-ts-rainbow', requires = 'nvim-treesitter/nvim-treesitter'}
  use {'romgrk/nvim-treesitter-context', requires = 'nvim-treesitter/nvim-treesitter'}
  use {'JoosepAlviste/nvim-ts-context-commentstring', requires = 'nvim-treesitter/nvim-treesitter'}
  use {'haringsrob/nvim_context_vt', requires = 'nvim-treesitter/nvim-treesitter'}

  -- Snippets
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'

  -- Syntax
  use 'andymass/vim-matchup'
  use 'RRethy/vim-illuminate'
  use 'windwp/nvim-autopairs'
  --- Editor config
  use 'editorconfig/editorconfig-vim'
  --- Docker
  use 'ekalinin/Dockerfile.vim'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
  }
  use 'kosayoda/nvim-lightbulb'
  use 'ray-x/lsp_signature.nvim'
  use 'simrat39/symbols-outline.nvim'

  -- Git
  use {
    'lewis6991/gitsigns.nvim',
    requires = 'nvim-lua/plenary.nvim',
  }
  use 'sindrets/diffview.nvim'
  use 'f-person/git-blame.nvim'

  -- Sessions
  use 'rmagatti/auto-session'
  use {
    'rmagatti/session-lens',
    requires = {
      'rmagatti/auto-session',
      'nvim-telescope/telescope.nvim'
    },
  }

  -- General plugins
  use 'famiu/bufdelete.nvim'
  use 'akinsho/nvim-toggleterm.lua'
  use 'tversteeg/registers.nvim'
  use 'tpope/vim-commentary'
  use 'tpope/vim-repeat'
  use 'airblade/vim-rooter'
  use 'tpope/vim-surround'

end)

