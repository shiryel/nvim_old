"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""" PLUGINS """""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin()

""""""""""""""""""""""" Themes: """"""""""""""""""""""" 
" Plug 'morhetz/gruvbox' " gruvbox

" Plug 'joshdick/onedark.vim' " onedark

" Plug 'tomasiser/vim-code-dark' " codedark


""""""""""""""""""""""" Snippets: """"""""""""""""""""""" 
Plug 'SirVer/ultisnips' " The ultimate snippet solution for Vim
"Plug 'honza/vim-snippets' " ultisnips engine

""""""""""""""""""""""" For Git: """"""""""""""""""""""" 
Plug 'tpope/vim-fugitive' " A Git wrapper so awesome, it should be illegal

Plug 'Xuyuanp/nerdtree-git-plugin' " A plugin of NERDTree showing git status

""""""""""""""""""""""" NerdTree: """"""""""""""""""""""
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " A tree explorer plugin for vim

""""""""""""""""""""""" Ctags: """""""""""""""""""""""""
" OBS: Ctag is necessary in the system
" Plug 'ludovicchabant/vim-gutentags'
"   let g:gutentags_cache_dir = '~/.tags_cache'

"Plug 'majutsushi/tagbar' " Displays tags in a window, ordered by scope
"   nmap <F7> :TagbarToggle<CR>

""""""""""""""""""""""" Vim-Airline: """""""""""""""""""

"Plug 'vim-airline/vim-airline' " lean & mean status/tabline for vim that's light as air
"Plug 'vim-airline/vim-airline-themes' " A collection of themes for vim-airline
"  let g:airline_powerline_fonts = 1
"  let g:airline_theme = 'badwolf' " Exclusive theme for airline_theme
  "let g:airline_symbols.linenr = 'Ξ' " Desbuga o LN

""""""""""""""""""""""" Vim-lightline: """""""""""""""""""
Plug 'itchyny/lightline.vim'
  
""""""""""""""""""""""" FZF: """""""""""""""""""

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " [INSTALLER] A command-line fuzzy finder 
Plug 'junegunn/fzf.vim' " A command-line fuzzy finder

""""""""""""""""""""" Motion: """"""""""""""""""""""""""
Plug 'justinmk/vim-sneak'

"Plug 'easymotion/vim-easymotion' " For easy motion on text, default leader: <leader><leader>

""""""""""""""""""" Miscellaneous: """""""""""""""""""""
Plug 'mhinz/vim-startify' " The fancy start screen for Vim

"Plug 'terryma/vim-multiple-cursors' " True Sublime Text style multiple selections for Vim

"Plug 'powerman/vim-plugin-AnsiEsc' " ANSI escape code support for documentation

Plug 'bling/vim-bufferline' " Super simple vim plugin to show the list of buffers in the command bar

Plug 'ryanoasis/vim-devicons' " Adds file type icons to Vim plugins such as: NERDTree, vim-airline, CtrlP, unite, Denite, lightline, vim-startify and many more
  
"Plug 'cohama/lexima.vim' " Auto close parentheses and repeat by dot dot dot...

""""""""""""""""""""""" Customization: """"""""""""""""""""""" 
"Plug 'tpope/vim-flagship'
"  set laststatus=2
"  set showtabline=2
"  set guioptions-=e
"  let g:tablabel =
"        \ \"%N%{flagship#tabmodified()} %{flagship#tabcwds('shorten',',')}"
"  autocmd User Flags call Hoist("buffer", \"fugitive#statusline")

Plug 'ryanoasis/vim-devicons'

Plug 'jpalardy/spacehi.vim' " Press F3 to color the spaces

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""" COC: """""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" TODO: verify if NixOS can do it with:
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" Nequirements:
" [nodejs, yarn]
" yarn config set prefix ~/.yarn
" echo 'export PATH="~/.yarn/bin/:$PATH"' >> .profile

" NixOs_requeriment:
"set shell=/bin/sh

" Snippets:
" Install coc-snippets with:
" :CocInstall coc-snippets

""""""""""""""""""""""" Elixir: """""""""""""""""""""""""""""
Plug 'JakeBecker/elixir-ls', {'do': 'mix deps.get && mix compile && mix elixir_ls.release -o release'}
"
" Add to :CocConfig on "languageserver"
" "elixirLS": {
"   "command": "~/.config/nvim/plugged/elixir-ls/release/language_server.sh",
"   "filetypes": ["elixir", "eelixir"]
" }

Plug 'sheerun/vim-polyglot', { 'for': 'elixir' } " A solid language pack for Vim (syntax, ident, compiler, etc...)

"" Credo integration:
"Plug 'neomake/neomake', { 'for': 'elixir' }
"    let g:neomake_elixir_enabled_makers = ['credo']
"    autocmd! BufWritePost *.ex Neomake
"    autocmd! BufWritePost *.exs Neomake

""""""""""""""""""""""" Elm: """""""""""""""""""""""""""""
" yarn add elm elm-format elm-live elm-test
" yarn global add @elm-tooling/elm-language-server
" if necessary use --ignore-engines

"" Sintax highlighting, Automatic indentation
Plug 'andys8/vim-elm-syntax'

" Add to :CocConfig on "languageserver"
" "elmLS": {
"   "command": "~/.yarn/bin/elm-language-server",
"   "filetypes": ["elm"],
"   "rootPatterns": ["elm.json"],
"   "initializationOptions": {
"   "elmAnalyseTrigger": "change" 
" }

call plug#end()
