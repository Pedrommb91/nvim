-- auto install packer if not installed
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
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])


local status, packer = pcall(require, "packer")
if not status then
  return
end

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  use { "ellisonleao/gruvbox.nvim" }
  
-- tmux & split window navigation
  use "christoomey/vim-tmux-navigator"
 
  -- commenting with gc
  use "numToStr/Comment.nvim"

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		 requires = { {'nvim-lua/plenary.nvim'} }
	}

  use { "fatih/vim-go" }

  use {
		'VonHeikemen/lsp-zero.nvim',
  	branch = 'v1.x',
    requires = {
	    {'neovim/nvim-lspconfig'},             -- Required
		  {'williamboman/mason.nvim'},           -- Optional
		  {'williamboman/mason-lspconfig.nvim'}, -- Optional
		  {'hrsh7th/nvim-cmp'},         -- Required
		  {'hrsh7th/cmp-nvim-lsp'},     -- Required
		  {'hrsh7th/cmp-buffer'},       -- Optional
		  {'hrsh7th/cmp-path'},         -- Optional
		  {'saadparwaiz1/cmp_luasnip'}, -- Optional
		  {'hrsh7th/cmp-nvim-lua'},     -- Optional
		  {'L3MON4D3/LuaSnip'},             -- Required
		  {'rafamadriz/friendly-snippets'}, -- Optional
  	},
    use {"akinsho/toggleterm.nvim", tag = '*' },
	  use "jhlgns/naysayer88.vim",
	  use "terrortylor/nvim-comment",
	  use "CreaturePhil/vim-handmade-hero"
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
