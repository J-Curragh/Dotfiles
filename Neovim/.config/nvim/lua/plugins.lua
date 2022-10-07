local status, packer = pcall(require, 'packer')

if (not status) then
  print("Packer is not installed.")
  return
end

vim.cmd [[packadd packer.nvim]]
packer.startup(function(use)
  -- Meta
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'
  -- Theme
  use { "catppuccin/nvim", as = "catppuccin" }
  -- Info lines
  use { "nvim-lualine/lualine.nvim",
    requires = "kyazdani42/nvim-web-devicons"
  }
  use 'akinsho/nvim-bufferline.lua'
  -- Completion
  use 'onsails/lspkind-nvim'
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'
  use 'hrsh7th/cmp-buffer' -- cmp source for buffer
  use 'hrsh7th/cmp-nvim-lsp' -- cmp source for nvim lsp
  use 'hrsh7th/cmp-path' -- cmp source for file system paths
  use 'hrsh7th/nvim-cmp' -- completion
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  -- LSP
  use "neovim/nvim-lspconfig"
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'simrat39/rust-tools.nvim'
  -- QoL
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'tpope/vim-surround'
  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'norcalli/nvim-colorizer.lua'
  use { 'folke/trouble.nvim',
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup({
        auto_open = false,
        use_diagnostic_signs = true
      })
    end
  }
  -- Formatting
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'MunifTanjim/prettier.nvim'
  -- Git
  use 'lewis6991/gitsigns.nvim'
  use 'dinhhuy258/git.nvim'
  use 'kdheepak/lazygit.nvim'
  --Java
  use 'mfussenegger/nvim-jdtls'
  -- LaTeX
  use 'lervag/vimtex'
end)
