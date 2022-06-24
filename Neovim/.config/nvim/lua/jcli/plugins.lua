local packer = require("jcli.packer").init()

return packer.startup(function(use)

  -- Packer plugin manager
  use("wbthomason/packer.nvim")

  -- Shared library for Neovim lua scripting
  use("nvim-lua/plenary.nvim")

  -- Telescope fzf modal
  use({
      "nvim-telescope/telescope.nvim",
      after = "plenary.nvim"
  })

  use({
      "nvim-telescope/telescope-project.nvim",
      after = "telescope.nvim"
  })

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  }

  -- Vim-style magit
  use({
      "TimUntersberger/neogit",
      after = "plenary.nvim"
  })

  -- Harpoon file nav bookmarking
  use("ThePrimeagen/harpoon")

  -- Terminal manager
  use("voldikss/vim-floaterm")

  -- Theme
  use("junegunn/seoul256.vim")

  -- Completion
  use("hrsh7th/nvim-cmp")

  -- Completion Sources
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")
  use("hrsh7th/cmp-nvim-lsp")
  use({ "saadparwaiz1/cmp_luasnip", after = "LuaSnip" }) -- luasnip as a source for cmp

  -- Snippets
  use("L3MON4D3/LuaSnip")
  use("rafamadriz/friendly-snippets")

  -- LSP
  use("neovim/nvim-lspconfig")
  use("williamboman/nvim-lsp-installer")

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  use({"p00f/nvim-ts-rainbow", after = "nvim-treesitter"})

  -- Linting
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  -- Discord Rich Presence
  use("andweeb/presence.nvim")

  -- Autopairs
  use("windwp/nvim-autopairs")

  -- Comment support
  use({
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end
  })

  -- Git Signs
  use({
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end
  })

end)

