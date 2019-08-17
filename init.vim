"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""" PLUGINS """""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin()

""""""""""""""""""""""" Themes: """"""""""""""""""""""" 
" Plug 'morhetz/gruvbox' " gruvbox

" Plug 'joshdick/onedark.vim' " onedark

Plug 'tomasiser/vim-code-dark' " codedark

""""""""""""""""""""""" Snippets: """"""""""""""""""""""" 
"Plug 'SirVer/ultisnips' " The ultimate snippet solution for Vim
"Plug 'honza/vim-snippets' " ultisnips engine
  " Trigger configuration. Do not use <tab> if you use
  " https://github.com/Valloric/YouCompleteMe.
  "let g:UltiSnipsExpandTrigger="<c-tab>"
  "let g:UltiSnipsJumpForwardTrigger="<c-q>"
  "let g:UltiSnipsJumpBackwardTrigger="<c-w>"
  "let g:UltiSnipsSnippetsDir = '~/.config/nvim/UltiSnips' " Diretorio dos snippets
  "let g:UltiSnipsEditSplit="vertical" " If you want :UltiSnipsEdit to split your window.

""""""""""""""""""""""" For Git: """"""""""""""""""""""" 
Plug 'tpope/vim-fugitive' " A Git wrapper so awesome, it should be illegal

Plug 'Xuyuanp/nerdtree-git-plugin' " A plugin of NERDTree showing git status

""""""""""""""""""""""" NerdTree: """"""""""""""""""""""
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " A tree explorer plugin for vim
  nmap <F6> :NERDTreeToggle<CR>
  "autocmd vimenter * NERDTree

""""""""""""""""""""""" Ctags: """""""""""""""""""""""""
" OBS: Ctag is necessary in the system
" Plug 'ludovicchabant/vim-gutentags'
"   let g:gutentags_cache_dir = '~/.tags_cache'

"Plug 'majutsushi/tagbar' " Displays tags in a window, ordered by scope
"   nmap <F7> :TagbarToggle<CR>

""""""""""""""""""""""" Vim-Airline: """""""""""""""""""

Plug 'vim-airline/vim-airline' " lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline-themes' " A collection of themes for vim-airline
  let g:airline_powerline_fonts = 1
  let g:airline_theme = 'badwolf' " Exclusive theme for airline_theme
  "let g:airline_symbols.linenr = 'Ξ' " Desbuga o LN
  
""""""""""""""""""""""" FZF: """""""""""""""""""

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " [INSTALLER] A command-line fuzzy finder 
Plug 'junegunn/fzf.vim' " A command-line fuzzy finder

  " Search on git versioned files
  noremap <Leader>f :GFiles<CR>
  " Search on all files
  noremap <Leader>F :Files<CR>
  " Search on the buffer history
  noremap <Leader>b :Buffers<CR>
  " Search on the file history
  noremap <Leader>h :History<CR>
  " Search on the buffer tags
  noremap <Leader>t :BTags<CR>
  " Search through the gutertags
  noremap <Leader>T :Tags<CR>
  " Search the buffer lines " like ag
  noremap <Leader>l :BLines<CR>
  " Search the lines " like /
  noremap <Leader>L :Lines<CR>
  " Search for the marks
  noremap <Leader>' :Marks<CR>
  " Project finder
  noremap <Leader>a :Ag<CR>
  " Shearch for help tags with full scren (! tag)
  noremap <Leader>H :Helptags!<CR>
  " Search for commands
  noremap <Leader>C :Commands<CR>
  " Search for the : history
  noremap <Leader>: :History:<CR>
  " Search for the / history
  noremap <Leader>/ :History/<CR>
  " Search for maps
  noremap <Leader>M :Maps<CR>
  " Serach for the sintax file type
  noremap <Leader>s :Filetypes<CR>

""""""""""""""""""" Miscellaneous: """""""""""""""""""""
Plug 'mhinz/vim-startify' " The fancy start screen for Vim

Plug 'easymotion/vim-easymotion' " For easy motion on text, default leader: <leader><leader>

"Plug 'terryma/vim-multiple-cursors' " True Sublime Text style multiple selections for Vim

"Plug 'powerman/vim-plugin-AnsiEsc' " ANSI escape code support for documentation

Plug 'bling/vim-bufferline' " Super simple vim plugin to show the list of buffers in the command bar
  let g:airline#extensions#bufferline#enabled = 1
  
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
""""""""""""""""""""""" Elixir: """""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""" Integration: """"""""""""""""""""""" 
Plug 'sheerun/vim-polyglot', { 'for': 'elixir' } " A solid language pack for Vim (syntax, ident, compiler, etc...)

Plug 'slashmili/alchemist.vim', { 'for': 'elixir' } " Elixir Integration (can jump with deoplete)
  let g:alchemist_tag_map = '<c-j>'
  let g:alchemist_tag_stack_map = '<c-t>'

Plug 'c-brenn/phoenix.vim', { 'for': 'elixir' } " phoenix.vim: rails.vim inspired tools for Phoenix
                           " gf -> juml | :Pserver | :Ppreview
Plug 'tpope/vim-projectionist', { 'for': 'elixir' } " required for some navigation features in phoenix

"" Completion and liting
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins', 'for': 'elixir' }
else
  Plug 'Shougo/deoplete.nvim', { 'for': 'elixir' }
  Plug 'roxma/nvim-yarp', { 'for': 'elixir' }
  Plug 'roxma/vim-hug-neovim-rpc', { 'for': 'elixir' }
endif
  let g:deoplete#enable_at_startup = 1

if !has("python3")
  echo "python3 missing"
  echo "run: pip3 install --user pynvim"
  echo "then run on vim: :UpdateRemotePlugins"
endif

""""""""""""""""""""""" Miscellaneous: """"""""""""""""""""""" 
Plug 'mmorearty/elixir-ctags', { 'for': 'elixir' } " ctags -R to build
    let g:tagbar_type_elixir = {
        \ 'ctagstype' : 'elixir',
        \ 'kinds' : [
            \ 'f:functions',
            \ 'functions:functions',
            \ 'c:callbacks',
            \ 'd:delegates',
            \ 'e:exceptions',
            \ 'i:implementations',
            \ 'a:macros',
            \ 'o:operators',
            \ 'm:modules',
            \ 'p:protocols',
            \ 'r:records',
            \ 't:tests'
        \ ]
    \ }

"""""""""""""""""""""""" Format: """"""""""""""""""""""""""""""
Plug 'mhinz/vim-mix-format', { 'for': 'elixir' }
    let g:mix_format_on_save = 1

"""""""""""""""""" Credo integration: """"""""""""""""""""""""""""""
Plug 'neomake/neomake', { 'for': 'elixir' }
    let g:neomake_elixir_enabled_makers = ['credo']
    autocmd! BufWritePost *.ex Neomake
    autocmd! BufWritePost *.exs Neomake

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""" Elm: """""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""" Language Suport: """"""""""""""""""""""" 
Plug 'elmcast/elm-vim', {'do': 'yarn glogal add elm elm-test elm-oracle elm-format', 'for': 'elm' }
" Requirements:
" yarn global add elm           # base
" yarn global add elm-test      # run unit tests
" yarn global add elm-oracle    # code completion and doc lookups
" yarn global add elm-format    # automatically format

let g:elm_jump_to_error = 1
let g:elm_make_output_file = "elm.min.js"
let g:elm_make_show_warnings = 1
let g:elm_syntastic_show_warnings = 1
let g:elm_browser_command = ""
let g:elm_detailed_complete = 1
let g:elm_format_autosave = 1
let g:elm_format_fail_silently = 0
let g:elm_setup_keybindings = 1

" Usage:
" :help elm-vim

""""""""""""""""""""""""""" Completion: """"""""""""""""""""""""
Plug 'dense-analysis/ale', { 'for': 'elm' }
Plug 'vim-syntastic/syntastic', { 'for': 'elm' }
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:elm_syntastic_show_warnings = 1
    
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py', 'for': 'elm' }
    let g:ycm_semantic_triggers = {
        \ 'elm' : ['.'],
        \}

" TODO: add deoplete?
    
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""" PLUGINS SPECIAL CONFIGS """""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""" Themes: """""""""""""""""""""""""""""""""
colorscheme codedark
set background=dark

""""""""""""""""""""""" Snippets: """""""""""""""""""""""""""""""""
"call deoplete#custom#source('ultisnips', 'matchers', ['matcher_fuzzy'])

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""" VIM CONFIGS """"""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set hidden  " Deixa voce abrir um novo arquivo na mesma tela sem tem que salvar o anterior [mas avisara caso voce tente fechar]
set number  " Mostra os numeros nas linhas
set relativenumber  " Os numeros sao relativos a linha posicinadas *otimo para saltos*
set mouse=a  " Habilita o mouse
set inccommand=split  " Habilita visualizaçao de alteraçoes pelos comandos

"" Transparent background
hi Normal guibg=NONE ctermbg=NONE
highlight clear LineNr
highlight clear EndOfBuffer
hi NonText ctermbg=NONE ctermbg=NONE

"" Leader commands
let mapleader="\<space>"  " Define um learder

" Abre o init.vim
nnoremap <leader><Leader>ie :e ~/.config/nvim/init.vim<cr>  
nnoremap <leader><Leader>is :e ~/.config/nvim/UltiSnips/
" Carrega o arquivo na memoria
nnoremap <leader><Leader>ir :source ~/.config/nvim/init.vim<cr>  
" Organizar buffers
nnoremap <Leader><Leader>l :ls<CR>
nnoremap <Leader><Leader>b :bp<CR>
nnoremap <Leader><Leader>f :bn<CR>
nnoremap <Leader><Leader>g :e#<CR>

" Re-map the buffers <Leader>b<number>b<new number>
" Use the <Leader><number> to acess
nnoremap <Leader>b :buffer
nnoremap <Leader>bn :echo bufnr('%')<CR>
let a = 1
let b = 1
while a <= 30
  while b <= 30
    execute "nnoremap <Leader>b" . a . "b" . b . " :nnoremap<Leader>" . b . " :" . a . "b\<CR>"
    let b += 1
  endwhile
  let b = 1
  let a += 1
endwhile

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

" Split constrol improve
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""" FILE TYPE EXTENSION """""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

au BufRead,BufNewFile *.ex set filetype=elixir
au BufRead,BufNewFile *.exs set filetype=elixir
au BufRead,BufNewFile *.elm set filetype=elm

filetype plugin on

autocmd VimEnter * source ~/.config/nvim/init.vim
