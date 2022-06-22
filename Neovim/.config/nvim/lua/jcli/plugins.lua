local vim = vim
local nvim_command = vim.api.nvim_command
local fn = vim.fn
local packer = nil 

local function init()

    local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

    if fn.empty(fn.glob(install_path)) > 0 then
        nvim_command('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
        nvim_command('packadd packer.nvim')
    end

    if packer == nil then
        packer = require 'packer'
        packer.init()
    end

    local use = packer.use
    packer.reset()
   
    -- Packer (Neovim plugin manager)
    use { 'wbthomason/packer.nvim' }

    -- Markdown Preview (Preview markdown files in browser w/ live reloading)
    use { "iamcco/markdown-preview.nvim",
          ft = { "markdown" },
          run = 'cd app && yarn install',
          cmd = 'MarkdownPreview', 
    }

    use { "kyazdani42/nvim-tree.lua",
          requires = {
              "kyazdani42/nvim-web-devicons"
          },
          config = function()
              require 'jcli.config.cfg-nvimtree'.init()
          end,
    }

    use { "jghauser/auto-pandoc.nvim",
          requires = "nvim-lua/plenary.nvim",
          config = function()
            require 'jcli.config.cfg-autopandoc'.init()
          end
    }

    use { "neovim/nvim-lspconfig" }

    use { "williamboman/nvim-lsp-installer",
          after = "nvim-lspconfig" }



end

return { init = init }
