(vim.cmd "packadd packer.nvim")

(let [packer (require :packer)]
  (packer.startup
   (fn [use]
     (use "wbthomason/packer.nvim")

     ;; LSP Support
     ; TODO

     (use "neovim/nvim-lspconfig")
     (use "kabouzeid/nvim-lspinstall")
     ; Completion
     (use "hrsh7th/nvim-compe" {:config nvim_compe})

     ;; Highlight

     ; :h nvim-treesitter-commands
     ; Its recommended to update the parsers on update
     (use "nvim-treesitter/nvim-treesitter" {:run ":TSUpdate" :config nvim_treesitter})

     (use "norcalli/nvim-colorizer.lua" {
       :config #(let [c (require :colorizer)] #c.setup)})
     ; uses a simple GTK+ dialog via Zenity or Yad
     (use "KabbAmine/vCoolor.vim")
     ; folke/lsp-colors.nvim
     (use "folke/lsp-colors.nvim")
     (use "rrethy/vim-illuminate")

     ;; Statusline

     (use "glepnir/galaxyline.nvim" {
       :branch "main"
       ; TODO :config status_line
       :requires ["kyazdani42/nvim-web-devicons" {:opt true}]})

     ;; Git

     (use "tpope/vim-fugitive")
     (use "lewis6991/gitsigns.nvim" {
       :requires ["nvim-lua/plenary.nvim"]
       :config #(let [g (require :gitsigns)] #g.setup)})

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
  (fn nvim_compe []
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
        :max_height (math:floor (* vim.o.lines 0.3))
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
        :luasnip false}})))

(let [nt (require :nvim-treesitter.configs)]
  (fn nvim_treesitter []
    (nt.setup {
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
        :enable true}})))
