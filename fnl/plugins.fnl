(vim.cmd "packadd packer.nvim")

(let [packer (require :packer)]
  (packer.startup
   (fn [use]
     (use "wbthomason/packer.nvim") ; base
     (use "nvim-lua/plenary.nvim") ; for lewis6991/gitsigns.nvim and 
		 (use "lifepillar/vim-colortemplate") ; for color templates

     ;; LSP Support
     (use "neovim/nvim-lspconfig")
     (use "hrsh7th/nvim-compe") ; Completion

     ;; Highlight
     ; TODO: remove when elixir TS comes back working
     (use "elixir-editors/vim-elixir")

     ; :h nvim-treesitter-commands
     ; Its recommended to update the parsers on update
     (use "nvim-treesitter/nvim-treesitter" {:run ":TSUpdate"})
     (use "KabbAmine/vCoolor.vim") ; uses a simple GTK+ dialog via Zenity or Yad
     (use "rrethy/vim-illuminate") ; automatically highlighting other uses of the word under the cursor

     ;; Git
		 (use "tpope/vim-fugitive") ; Git commands, eg: diff
     (use "lewis6991/gitsigns.nvim") ; Lines changed
     (use "Xuyuanp/nerdtree-git-plugin") ; Files changed

     ;; FZF
     (use "junegunn/fzf")
     (use "junegunn/fzf.vim")

     ;; Miscellaneous
     (use "scrooloose/nerdtree" {"cmd" "NERDTreeToggle"})
     (use "mhinz/vim-startify")
     (use "folke/which-key.nvim")
     ; TODO: check it out in the future
     ;(use "hoschi/yode-nvim")

     ;; Lisp
     (use "vlime/vlime" {"rtp" "vim/"}))))

(let [compe (require :compe)]
  (compe.setup {
    :enabled true
    :autocomplete true
    :debug false
    :min_length 1
    :preselect "enable"
    :throttle_time 80
    :source_timeout 200
    :resolve_timeout 800
    :incomplete_delay 400
    :max_abbr_width 100
    :max_kind_width 100
    :max_menu_width 100
    :documentation {
      :border [ "" "" "" " " "" "" "" " " ] ; the border option is the same as `|help nvim_open_win|`
      :winhighlight "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder"
      :max_width 120
      :min_width 60
      :max_height (math.floor (* vim.o.lines 0.3))
      :min_height 1
    }
    :source {
      :path true
      :buffer true
      :calc true
      :nvim_lsp true
      :nvim_lua true
      :vsnip false
      :ultisnips false
      :luasnip false}}))

; TODO: elixir is not working on treesitter
(let [ts (require :nvim-treesitter.configs)]
	(ts.setup {
		:ensure_installed "maintained"
    ;:ignore_install ["elixir"]
		:highlight {
			:enable true
      :disable ["elixir"]
		}
		:incremental_selection {
			:enable true
      ;:disable ["elixir"]
			:keymaps {
			  :init_selection "gnn"
			  :node_incremental "grn"
			  :scope_incremental "grc"
			  :node_decremental "grm"
			}
		}
		:indent {
			:enable true
      ;:disable ["elixir"]
      }}))

(let [g (require :gitsigns)] 
	(g.setup {
		:numhl true
		:signcolumn false
		:current_line_blame true
		:attach_to_untracked true
		:sign_priority 6
		:update_debounce 100
		:status_formatter nil ; use default
		:max_file_length 40000
	; :use_internal_diff true
		:preview_config {
			; Options passed to nvim_open_win
			:border "single"
			:style "minimal"
			:relative "cursor"
			:row 0
			:col 1}}))

(let [wk (require :which-key)] 
  (wk.setup {
    :plugins {
      :marks true
      :registers true
      :spelling {
        :enabled true
        :suggestions 20}
    }
    :ignore_missings false
    :triggers_blacklist {
      :i ["j" "k"]
      :v ["j" "k"]}
    }))
