--local Plug = vim.fn['plug#']
--
--vim.call('plug#begin', '~/AppData/Local/nvim/plugged')
--
--Plug 'Mofiqul/dracula.nvim'
--Plug 'preservim/nerdtree'
--Plug 'neoclide/coc.nvim', {'branch': 'release'}
--
--vim.call('plug#end')


vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'dracula/vim'
  use 'wbthomason/packer.nvim' -- Package manager
  use 'preservim/nerdtree'
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
  -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'kyazdani42/nvim-web-devicons'
  use 'tpope/vim-fugitive'
end)
