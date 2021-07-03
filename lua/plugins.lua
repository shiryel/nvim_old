-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Dev setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API
  -- use 'folke/lua-dev.nvim'

  -----------------
  -- LSP Support --
  -----------------

  use {'neovim/nvim-lspconfig'}
  use {'kabouzeid/nvim-lspinstall'}

  -- Completion
  use {
    'hrsh7th/nvim-compe',
    config = function ()
      require'compe'.setup {
        enabled = true;
        autocomplete = true;
        debug = false;
        min_length = 1;
        preselect = 'enable';
        throttle_time = 80;
        source_timeout = 200;
        resolve_timeout = 800;
        incomplete_delay = 400;
        max_abbr_width = 100;
        max_kind_width = 100;
        max_menu_width = 100;
        documentation = {
          border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
          winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
          max_width = 120,
          min_width = 60,
          max_height = math.floor(vim.o.lines * 0.3),
          min_height = 1,
        };
        source = {
          path = true;
          buffer = true;
          calc = true;
          nvim_lsp = true;
          nvim_lua = true;
          vsnip = false;
          ultisnips = false;
          luasnip = false;
        };
      }
    end
  }

  ---------------
  -- Highlight --
  ---------------

  -- NOTE: Folds the files
  -- NOTE: For a list of all commands
  -- :h nvim-treesitter-commands 
  use {
    'nvim-treesitter/nvim-treesitter', 
    run = ':TSUpdate',
    -- Its recommended to update the parsers on update
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

  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end
  }

  -- uses a simple GTK+ dialog via Zenity or Yad
  use {'KabbAmine/vCoolor.vim'}

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
    config = function() require'status_line' end,
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
