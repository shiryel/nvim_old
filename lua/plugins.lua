-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Dev setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API
  use 'folke/lua-dev.nvim'

  -----------------
  -- LSP Support --
  -----------------

  use {'neovim/nvim-lspconfig'}
  use {'kabouzeid/nvim-lspinstall'}
  use {'glepnir/lspsaga.nvim'}

  -- Completion
  use {'nvim-lua/completion-nvim'}

  ---------------
  -- Highlight --
  ---------------

  -- NOTE: Folds the files
  -- NOTE: For a list of all commands
  -- :h nvim-treesitter-commands 
  use {
    'nvim-treesitter/nvim-treesitter', 
    run = ':TSUpdate',
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = "maintained",
        highlight = {
          enable = true
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm"
          }
        },
        indent = {
          enable = true
        }
      }
    end
  }


  -- Its recommended to update the parsers on update


  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end
  }

  use {'folke/lsp-colors.nvim'}

  ----------------
  -- Statusline --
  ----------------

  use {
    'glepnir/galaxyline.nvim',
    branch = 'main',
    -- the statusline
    config = function() require'status_line' end,
    -- some optional icons
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -----------
  -- Theme --
  -----------

  use {'morhetz/gruvbox'}

  -------------------
  -- Miscellaneous --
  -------------------

  -- A tree explorer plugin for vim
  use {'scrooloose/nerdtree', cmd = 'NERDTreeToggle'}

  -- The fancy start screen for Vim
  use {'mhinz/vim-startify'}

  -- Motion
  use {'justinmk/vim-sneak'}

  -- Displays a popup with possible key bindings of the command you started typing.
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

end)
