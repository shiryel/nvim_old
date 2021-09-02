(vim.cmd "packadd packer.nvim")

(let [packer (require :packer)]
  (packer.startup
   (fn [use]
     (use "wbthomason/packer.nvim")
     ; for lewis6991/gitsigns.nvim and 
     (use "nvim-lua/plenary.nvim")

     ;; LSP Support

     (use "neovim/nvim-lspconfig")
     (use "kabouzeid/nvim-lspinstall")
     ; Completion
     (use "hrsh7th/nvim-compe")

     ;; Highlight

     ; :h nvim-treesitter-commands
     ; Its recommended to update the parsers on update
     (use "nvim-treesitter/nvim-treesitter" {:run ":TSUpdate"})

		 ; color highlighter
     (use "norcalli/nvim-colorizer.lua" {
       :config #(let [c (require :colorizer)] (c.setup))})
     ; uses a simple GTK+ dialog via Zenity or Yad
     (use "KabbAmine/vCoolor.vim")
		 ; automatically highlighting other uses of the word under the cursor
     (use "rrethy/vim-illuminate")

     ;; Statusline

     (use "glepnir/galaxyline.nvim" {
       :branch "main"
       ; TODO :config status_line
       :requires ["kyazdani42/nvim-web-devicons" {:opt true}]})

     ;; Git

     (use "lewis6991/gitsigns.nvim")
     (use "Xuyuanp/nerdtree-git-plugin")

     ;; FZF

     (use "junegunn/fzf")
     (use "junegunn/fzf.vim")

     ;; Theme

     (use "morhetz/gruvbox")

     ;; Miscellaneous

     (use "scrooloose/nerdtree" {"cmd" "NERDTreeToggle"})
     (use "mhinz/vim-startify")
     (use "justinmk/vim-sneak")
     (use "folke/which-key.nvim"))))

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

(let [ts (require :nvim-treesitter.configs)]
	(ts.setup {
		:ensure_installed "maintained"
		:highlight {
			:enable true
		}
		:incremental_selection {
			:enable true
			:keymaps {
			  :init_selection "gnn"
			  :node_incremental "grn"
			  :scope_incremental "grc"
			  :node_decremental "grm"
			}
		}
		:indent {
			:enable true}}))

(let [g (require :gitsigns)] 
	(g.setup {
		:numhl true
		:signcolumn false
		:signs {
			; disabled by signcolumn
			:add {:hl "GitSignsAdd" :text "│" :numhl "GitSignsAddNr" :linehl "GitSignsAddLn"}
			:change {:hl "GitSignsChange" :text "│" :numhl "GitSignsChangeNr" :linehl "GitSignsChangeLn"}
			:delete {:hl "GitSignsDelete" :text "_" :numhl "GitSignsDeleteNr" :linehl "GitSignsDeleteLn"}
			:topdelete {:hl "GitSignsDelete" :text "‾" :numhl "GitSignsDeleteNr" :linehl "GitSignsDeleteLn"}
			:changedelete {:hl "GitSignsChange" :text "~" :numhl "GitSignsChangeNr" :linehl "GitSignsChangeLn"}}
		:current_line_blame true
		:attach_to_untracked true
		:sign_priority 6
		:update_debounce 100
		:status_formatter nil ; use default
		:max_file_length 40000
		:preview_config {
			; Options passed to nvim_open_win
			:border "single"
			:style "minimal"
			:relative "cursor"
			:row 0
			:col 1}
		:use_internal_diff true}))
