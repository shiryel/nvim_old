"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""" GENERAL """""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

colorscheme gruvbox
"let g:lightline = { 'colorscheme': 'gruvbox' }

"" Set <Leader>
let mapleader="\<space>"

" Open configs
nnoremap <leader><Leader>i :e ~/.config/nvim/init.vim<cr>  
nnoremap <leader><Leader>c :e ~/.config/nvim/src/configs.vim<cr>  
nnoremap <leader><Leader>p :e ~/.config/nvim/lua/plugins.lua<cr>  
nnoremap <leader><Leader>l :e ~/.config/nvim/lua/lsp.lua<cr>  
" Load new configs
nnoremap <leader><Leader>r :source ~/.config/nvim/init.vim<cr>  

" Buffers moves
nnoremap <Leader>bl :ls<CR>
nnoremap <Leader>bb :bp<CR>
nnoremap <Leader>bf :bn<CR>
nnoremap <Leader>bg :e#<CR>

" Split moves
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Clipboard
nnoremap <Leader>y "+y
vnoremap <Leader>y "+y
nnoremap <Leader>p "+p
vnoremap <Leader>p "+p

" Deselect seach
map <Leader>n :noh<CR>

" Convert existing tabs
nnoremap <Leader><Tab> :retab<CR>

nnoremap <Leader><Leader>t :vsp <Bar> :terminal<CR> <Bar> i

" Disable keyboard arrows
nnoremap <Left> :echo "No left for you!"<CR>
vnoremap <Left> :<C-u>echo "No left for you!"<CR>
"inoremap <Left> <C-o>:echo "No left for you!"<CR>
nnoremap <Right> :echo "No left for you!"<CR>
vnoremap <Right> :<C-u>echo "No left for you!"<CR>
"inoremap <Right> <C-o>:echo "No left for you!"<CR>
nnoremap <Up> :echo "No left for you!"<CR>
vnoremap <Up> :<C-u>echo "No left for you!"<CR>
"inoremap <Up> <C-o>:echo "No left for you!"<CR>
nnoremap <Down> :echo "No left for you!"<CR>
vnoremap <Down> :<C-u>echo "No left for you!"<CR>
"inoremap <Down> <C-o>:echo "No left for you!"<CR>

syntax enable

" Colors and styling 
highlight Comment cterm=italic
hi link xmlEndTag xmlTag
hi htmlArg gui=italic
hi Comment gui=italic
hi Type gui=italic
hi htmlArg cterm=italic
hi Comment cterm=italic
hi Type cterm=italic
set termguicolors " to work with 16M colors schemes in the terminal

" Spaces and Tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" UI Config
set encoding=utf8
set inccommand=nosplit " Give us a realtime preview of substitution before we send it
"set list " show formating characters
set lcs=eol:¬,extends:❯,precedes:❮,tab:>- " the formating characters
set number " show line number
set relativenumber " line number is relative to cursor
set mouse=a " enable mouse
set noruler " hide the column and line of the pointer
set nocursorline " dont highlight the current cursor line
set smartindent " smart ident (priority for C like langs)
set autoindent " copy the ident of current line when using the o or O commands
set wrap " continue long lines in the next line
set linebreak
set wildmenu " menu inline (ex: completion)
set lazyredraw " screen will not redrawn while exec macros, registers or not typed commands
set showmatch " jump to a match when executed
set noshowmode " lightline shows the status not vim
set showtabline=2 " always show files with tab page labels
set shortmess=a " avoid hit-enter prompts, a = abbreviation without loss
set updatetime=300 " time (ms) to save in swap
set signcolumn=no " hide the column for error signs
set showcmd " show commands in the last line off screen

" Searching 
set incsearch " show when typing
set hlsearch " highlight
set nosmartcase " do not override the ignorecase option
set ignorecase " ignorecase option :P

" Folding 
set foldenable " use zi to togle folding
set foldlevelstart=1 " some folds closed when start editing
set foldnestmax=2 " limit the folds in the indent and syntax

set nobackup " no backup file when overwriting
set nowritebackup " no make backup before overwriting
set swapfile " enable swapfile (dont use it with confidential information, that even root must not be able to acess!)
set hidden " buffer continue to exists when the file is abandoned
set history=100 " history of the : commands
set path+=** " list of directories which will be searched when using the |gf|, [f, ]f, ^Wf, |:find|, |:sfind|, |:tabfind| and other commands
set splitbelow " default split below
set diffopt=vertical " default diff split in the vertical


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""" PLUGINS """""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""" For Git: """"""""""""""""""""""" 
  " To not open files and other buffers on NerdTree window
  autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif

""""""""""""""""""""""" NerdTree: """"""""""""""""""""""
  " Explorer
  nmap <Leader>e :NERDTreeToggle<CR>
  let NERDTreeShowHidden=1

""""""""""""""""""""""" FZF: """""""""""""""""""
  " Ag result, ALL
  noremap <Leader>sa :Ag<CR>
  " Rg result, Search inside ALL
  noremap <Leader>ss :Rg<CR>
  " Search on git versioned files
  noremap <Leader>sf :GFiles<CR>
  " Search on all files
  noremap <Leader>sF :Files<CR>
  " Search on the buffer history
  noremap <Leader>sb :Buffers<CR>
  " Search on the file history
  noremap <Leader>sh :History<CR>
  " Search on the buffer tags
  noremap <Leader>st :BTags<CR>
  " Search through the gutertags
  noremap <Leader>sT :Tags<CR>
  " Serach for the sintax file type
  noremap <Leader>st :Filetypes<CR>
  " Search the buffer lines " like ag
  noremap <Leader>sl :BLines<CR>
  " Search the lines " like /
  noremap <Leader>sL :Lines<CR>
  " Search for the marks
  noremap <Leader>s' :Marks<CR>
  " Shearch for help tags with full scren (! tag)
  noremap <Leader>sH :Helptags!<CR>
  " Search for commands
  noremap <Leader>sc :Commands<CR>
  " Search for the : history
  noremap <Leader>s: :History:<CR>
  " Search for the / history
  noremap <Leader>s/ :History/<CR>
  " Search for maps
  noremap <Leader>sM :Maps<CR>
  
""""""""""""""""""""" Motion: """"""""""""""""""""""""""
  let g:sneak#label = 1

""""""""""""""""""""""" VCoolor: """"""""""""""""""""""" 

nmap <silent> <leader>c :VCoolor<CR>

""""""""""""""""""""" LSP: """"""""""""""""""""""""""

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

""""""""""""""""""""" Nvim-Compe: """"""""""""""""""""""""""

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

""""""""""""""""""""" Completion: """"""""""""""""""""""""""
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" completion menu
" for a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

"set omnifunc=v:lua.vim.lsp.omnifunc

" Go to...
nnoremap <silent><leader>gd <cmd>lua vim.lsp.buf.definition()<cr>
nnoremap <silent><leader>gD <cmd>lua vim.lsp.buf.declaration()<cr>
nnoremap <silent><leader>gt <cmd>lua vim.lsp.buf.type_definition()<cr>
nnoremap <silent><leader>gi <cmd>lua vim.lsp.buf.implementation()<cr>
nnoremap <silent><leader>gr <cmd>lua vim.lsp.buf.references()<cr>

" Help
nnoremap <silent><leader>h <cmd>lua vim.lsp.buf.signature_help()<cr>
nnoremap <silent><leader>H <cmd>lua vim.lsp.buf.hover()<cr>

" Rename
nnoremap <silent><leader>rn <cmd>lua vim.lsp.buf.rename()<cr>

" Workspaces
nnoremap <silent><leader>wr <cmd>lua vim.lsp.buf.add_workspace_folder()<cr>
nnoremap <silent><leader>wl <cmd>lua vim.lsp.buf.list_workspace_folders()<cr>
nnoremap <silent><leader>q <cmd>lua vim.lsp.diagnostic.set_loclist()<cr>

" Goto ...
nnoremap <silent><C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<cr>
nnoremap <silent><C-m> <cmd>lua vim.lsp.diagnostic.goto_next()<cr>

" Format
" if client.resolved_capabilities.document_formatting then
nnoremap <silent><leader>f <cmd>lua vim.lsp.buf.formatting()<cr>
" elseif client.resolved_capabilities.document_range_formatting then
nnoremap <silent><leader>F <cmd>lua vim.lsp.buf.range_formatting()<cr>

" Document Highlight
" if client.resolved_capabilities.document_highlight then
augroup lsp_document_highlight
autocmd! * <buffer>
autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
augroup END
