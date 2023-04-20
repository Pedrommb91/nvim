-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  
  -- color scheme
  use({
      'rose-pine/neovim',
      as = 'rose-pine',
      config = function()
          vim.cmd('colorscheme rose-pine')
      end
  })

  -- Productivity
  use { "nvim-tree/nvim-web-devicons" }
  use "nvim-lualine/lualine.nvim"
  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.1',
      -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
  }

  use('theprimeagen/harpoon')

  -- Development
  use "lewis6991/gitsigns.nvim"
  use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use "nvim-treesitter/nvim-treesitter-textobjects"
  use('mbbill/undotree')
  use('tpope/vim-fugitive')

  use {'ray-x/go.nvim', run = ':GoUpdateBinaries'}
  use "fatih/vim-go"                        -- https://github.com/fatih/vim-go
  use "SirVer/ultisnips"                    -- https://github.com/sirver/UltiSnips
  use "hrsh7th/cmp-nvim-lsp"                -- https://github.com/hrsh7th/cmp-nvim-lsp
  use "hrsh7th/nvim-cmp"                    -- https://github.com/hrsh7th/nvim-cmp
  use "neovim/nvim-lspconfig"               -- https://github.com/neovim/nvim-lspconfig
  use "onsails/lspkind-nvim"                -- https://github.com/onsails/lspkind-nvim
  use "quangnguyen30192/cmp-nvim-ultisnips" -- https://github.com/quangnguyen30192/cmp-nvim-ultisnips
  use "williamboman/nvim-lsp-installer"     -- https://github.com/williamboman/nvim-lsp-installer

  use 'mfussenegger/nvim-dap'
  use 'leoluz/nvim-dap-go'
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} 
}
end)
