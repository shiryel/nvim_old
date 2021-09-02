;;;;;;;;;;;
; Options ;
;;;;;;;;;;;

(local g vim.g)
(local o vim.opt)
(local c vim.cmd)

(c "colorscheme gruvbox")
(c "syntax enable")
(c "highlight Comment cterm=italic")
(c "hi link xmlEndTag xmlTag")
(c "hi htmlArg gui=italic")
(c "hi Comment gui=italic")
(c "hi Type gui=italic")
(c "hi htmlArg cterm=italic")
(c "hi Comment cterm=italic")
(c "hi Type cterm=italic")

; to work with 16M colors schemes in the terminal
(set o.termguicolors true)

;; Spaces and Tabs
(set o.syntax "enable")
(set o.tabstop 2)
(set o.softtabstop 2)
(set o.shiftwidth 2)

;; UI Config
(set o.encoding "utf8")
(set o.inccommand "nosplit") ; give us a realtime preview of substitution before we send it "set list " show formating characters
(set o.lcs "eol:¬,extends:❯,precedes:❮,tab:>-") ; the formating characters
(set o.number true)
(set o.relativenumber true) ; line number is relative to cursor
(set o.mouse "a") ; enable mouse
(set o.cursorline false) ; dont highlight the current cursor line
(set o.smartindent true) ; smart ident (priority for C like langs)
(set o.autoindent true) ; copy the ident of current line when using the o or O commands
(set o.wrap true) ; continue long lines in the next line
(set o.linebreak true)
(set o.lazyredraw true) ; screen will not redrawn while exec macros, registers or not typed commands
(set o.showmatch true) ; jump to a match when executed
(set o.showmode false) ; lightline shows the status not vim
(set o.showtabline 2) ; always show files with tab page labels
(set o.shortmess "ac") ; avoid hit-enter prompts, a = abbreviation without loss, c = avoid showing message extra message when using completion
(set o.updatetime 300) ; time (ms) to save in swap.  You will have bad experience for diagnostic messages when it's default 4000.
(set o.signcolumn "no") ; hide the column for error signs
(set o.showcmd true) ; show commands in the last line off screen
(set o.cmdheight 2) ; better display for messages

;; StatusLine
; f to only file name
(set o.statusline "%F%m%r%h%w %=%< [%Y] [0x%02.2B]%4v,%4l %3p%% of %L")
(set o.ruler false) ; hide the column and line of the pointer
(set o.laststatus 2) ; always shows the status line on other windows

;; Folding
(set o.foldenable true) ; use zi to togle folding
(set o.foldlevelstart 0) ; some folds closed when start editing
(set o.foldnestmax 10) ; limit the folds in the indent and syntax

(set o.backup false) ; no backup file when overwriting
(set o.writebackup false) ; no make backup before overwriting
(set o.swapfile true) ; enable swapfile (dont use it with confidential information, that even root must not be able to acess!)
(set o.hidden true) ; buffer continue to exists when the file is abandoned
(set o.history 100) ; history of the : commands
(o.path:append ["**"]) ; list of directories which will be searched when using the |gf|, [f, ]f, ^Wf, |:find|, |:sfind|, |:tabfind| and other commands
(set o.splitbelow true) ; default split below
(set o.diffopt "vertical") ; default diff split in the vertical

;; Searching
(set o.incsearch true) ; show when typing
(set o.hlsearch true) ; highlight
(set o.smartcase false) ; do not override the ignorecase option
(set o.ignorecase true) ; ignorecase option :P

;; completion
(set o.wildmenu true) ; menu inline
(set o.wildmode "full,list:lastused") ; full fist because is how the plugin works
(set o.completeopt "menuone,preview,noselect,noinsert")

; ignore on tab completing
(vim.opt.wildignore:append
 ["*.o"
  "*~"
  ".**"
  "build/**"
  "log/**"
  "tmp/**"])

; Set <Leader>
(set g.mapleader " ")

;;;;;;;;;;;
; Configs ;
;;;;;;;;;;;

(fn nnoremap [bind command]
  (vim.api.nvim_set_keymap "n" bind command {"noremap" true "silent" true}))

(fn inoremap [bind command]
  (vim.api.nvim_set_keymap "i" bind command {"noremap" true "silent" true "expr" true}))

(fn cnoremap [bind command]
  (vim.api.nvim_set_keymap "c" bind command {"noremap" true "silent" true "expr" true}))

(fn noremap [bind command]
  (vim.api.nvim_set_keymap "" bind command {"noremap" true "silent" true}))

; Open configs
(nnoremap "<leader><Leader>i" ":e ~/.config/nvim/init.fnl<cr>")
(nnoremap "<leader><Leader>c" ":e ~/.config/nvim/fnl/configs.fnl<cr>")
(nnoremap "<leader><Leader>p" ":e ~/.config/nvim/fnl/plugins.fnl<cr>")
; Load ned configs
(nnoremap "<leader><Leader>r" ":lua reload()<cr>")

; Buffer moves
(nnoremap "<leader>bn" ":ls<cr>")
(nnoremap "<leader>be" ":bp<cr>")
(nnoremap "<leader>bo" ":bn<cr>")
(nnoremap "<leader>bi" ":e;<cr>")

; Spit moves
(nnoremap "<c-n>" "<c-w><c-h>")
(nnoremap "<c-e>" "<c-w><c-j>")
(nnoremap "<c-o>" "<c-w><c-k>")
(nnoremap "<c-i>" "<c-w><c-l>")

; Remap splits
(noremap "<leader>vs" ":vs<cr>")
(noremap "<leader>vv" ":sp<cr>")

; Clipboard
(noremap "<leader>y" "\"+y")
(noremap "<leader>p" "\"+p")

; Save
(nnoremap "<leader>w" ":w<cr>")

; Deselect
(nnoremap "<leader>n" ":noh<cr>")

; Convert existing tabs
(nnoremap "<leader><tab>" ":retab<cr>")

; Open terminal
(nnoremap "<leader>t" ":sp <Bar> :terminal<cr> <bar> i")

;; NerdTree
(noremap "<leader>e" ":NERDTreeToggle<cr>")
(set g.NERDTreeShowHidden 1)
; To not open files and other buffers on NerdTree window
;(c "autocmd BufEnter * if bufname('#') =~# ^NERD_tree_ && winnr('$') > 1 | b# | endif")

;; Vim Sneak
(set g.sneak#label 1)

;; FZF
; Ag result, ALL
(noremap "<Leader>sa" ":Ag<CR>")
; Rg result, Search inside ALL
(noremap "<Leader>ss" ":Rg<CR>")
; Search on git versioned files
(noremap "<Leader>sf" ":GFiles<CR>")
; Search on all files
(noremap "<Leader>sF" ":Files<CR>")
; Search on the buffer history
(noremap "<Leader>sb" ":Buffers<CR>")
; Search on the file history
(noremap "<Leader>sh" ":History<CR>")
; Search on the buffer tags
(noremap "<Leader>st" ":BTags<CR>")
; Search through the gutertags
(noremap "<Leader>sT" ":Tags<CR>")
; Serach for the sintax file type
(noremap "<Leader>st" ":Filetypes<CR>")
; Search the buffer lines " like ag
(noremap "<Leader>sl" ":BLines<CR>")
; Search the lines " like /
(noremap "<Leader>sL" ":Lines<CR>")
; Search for the marks
(noremap "<Leader>s'" ":Marks<CR>")
; Shearch for help tags with full scren (! tag)
(noremap "<Leader>sH" ":Helptags!<CR>")
; Search for commands
(noremap "<Leader>sc" ":Commands<CR>")
; Search for the : history
(noremap "<Leader>s:" ":History:<CR>")
; Search for the / history
(noremap "<Leader>s/" ":History/<CR>")
; Search for maps
(noremap "<Leader>sM" ":Maps<CR>")

;; VCoolor
(nnoremap "<leader>c" ":VCoolor<CR>")

;; Nvim-Compe
(inoremap "<C-n>" "pumvisible() ? \"\\<C-n>\" : compe#complete()")
(inoremap "<CR>" "compe#confirm('<CR>')")

;; Completion
; <C-i> - open
; <C-n> - next
; <C-p> - previous
; NOTE: sometimes <Tab> == <C-i>
; FIXME:
;(cnoremap "<C-n>" "wildmenumode() ? \"\\<C-e>\" : \"\\<Tab>\"")

; Go to...
(nnoremap "<leader>gd" "<cmd>lua vim.lsp.buf.definition()<cr>")
(nnoremap "<leader>gD" "<cmd>lua vim.lsp.buf.declaration()<cr>")
(nnoremap "<leader>gt" "<cmd>lua vim.lsp.buf.type_definition()<cr>")
(nnoremap "<leader>gi" "<cmd>lua vim.lsp.buf.implementation()<cr>")
(nnoremap "<leader>gr" "<cmd>lua vim.lsp.buf.references()<cr>")

; Help
(nnoremap "<leader>h" "<cmd>lua vim.lsp.buf.signature_help()<cr>")
(nnoremap "<leader>H" "<cmd>lua vim.lsp.buf.hover()<cr>")

; Rename
(nnoremap "<leader>rn" "<cmd>lua vim.lsp.buf.rename()<cr>")

; Workspaces
(nnoremap "<leader>wr" "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>")
(nnoremap "<leader>wl" "<cmd>lua vim.lsp.buf.list_workspace_folders()<cr>")
(nnoremap "<leader>q" "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>")

; Goto ...
(nnoremap "<C-g>" "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>")
(nnoremap "<C-G>" "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>")

(c "au BufRead,BufNewFile *.ex set filetype=elixir")
(c "au BufRead,BufNewFile *.exs set filetype=elixir")

(c "au FileType elm set tabstop=4")
(c "au FileType elm set shiftwidth=4")
(c "au FileType elm set expandtab")
