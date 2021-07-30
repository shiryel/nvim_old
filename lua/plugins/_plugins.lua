-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local configs = require("plugins/configs")

return require('packer').startup(function(use)
  -- Packer can manage itself
  use {'wbthomason/packer.nvim'}

  -- Dev setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API
  -- use 'folke/lua-dev.nvim'

  -----------------
  -- LSP Support --
  -----------------

  use {'neovim/nvim-lspconfig'}
  use {'kabouzeid/nvim-lspinstall'}

  -- Completion
  use {'hrsh7th/nvim-compe', config = configs.nvim_compe}

  ---------------
  -- Highlight --
  ---------------

  -- NOTE: Folds the files
  -- NOTE: For a list of all commands
  -- :h nvim-treesitter-commands
  -- Its recommended to update the parsers on update
  use {
    'nvim-treesitter/nvim-treesitter', 
    run = ':TSUpdate', 
    config = configs.nvim_treesitter
  }

  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end
  }

  -- uses a simple GTK+ dialog via Zenity or Yad
  use {'KabbAmine/vCoolor.vim'}

  -- Automatically creates missing LSP diagnostics highlight groups for color schemes that don't yet support the Neovim 0.5 builtin lsp client.
  use {'folke/lsp-colors.nvim'}

  -- highlight matching words when cursor on it
  -- can be configured with LSP integration
  use {'rrethy/vim-illuminate'}

  ----------------
  -- Statusline --
  ----------------

  use {
    'glepnir/galaxyline.nvim',
    branch = 'main',
    -- the statusline
    config = function() require('plugins/status_line') end,
    -- some optional icons
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  ---------
  -- GIT --
  ---------

  -- Git Support
  use {'tpope/vim-fugitive'}

  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('gitsigns').setup()
    end
  }

  ---------
  -- FZF --
  ---------

  use {'junegunn/fzf'}
  use {'junegunn/fzf.vim'}

  -----------
  -- Theme --
  -----------

  use {'morhetz/gruvbox'}

  ------------------
  -- Organization --
  ------------------

  use {'vhyrro/neorg', requires = "nvim-lua/plenary.nvim", config = configs.neorg}

  -------------------
  -- Miscellaneous --
  -------------------

  -- Better Window quickfix
  -- use { 'kevinhwang91/nvim-bqf', config = function() require 'lt.plugins.nvim-bqf' end}

  -- A tree explorer plugin for vim
  use {'scrooloose/nerdtree', cmd = 'NERDTreeToggle'}

  -- Changes the working directory to the project root when you open a file or directory
  use {'airblade/vim-rooter'}

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
