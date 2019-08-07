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
Plug 'scrooloose/nerdtree' " A tree explorer plugin for vim
  nmap <F6> :NERDTreeToggle<CR>
  "autocmd vimenter * NERDTree

""""""""""""""""""""""" Ctags: """""""""""""""""""""""""
" OBS: Ctag is necessary in the system
" Plug 'ludovicchabant/vim-gutentags'
"   let g:gutentags_cache_dir = '~/.tags_cache'

"Plug 'majutsushi/tagbar' " Displays tags in a window, ordered by scope
"   nmap <F7> :TagbarToggle<CR>

""""""""""""""""""""""" Vim-Airline: """""""""""""""""""

"Plug 'vim-airline/vim-airline' " lean & mean status/tabline for vim that's light as air
"Plug 'vim-airline/vim-airline-themes' " A collection of themes for vim-airline
  "let g:airline_powerline_fonts = 1
  "let g:airline_symbols.linenr = 'Ξ' " Desbuga o LN
  "let g:airline_theme = 'badwolf' " Exclusive theme for airline_theme

""""""""""""""""""""""" FZF: """""""""""""""""""
  
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " [INSTALLER] A command-line fuzzy finder 
Plug 'junegunn/fzf.vim' " A command-line fuzzy finder

" Ctrl+p navega por arquivo [usando o plug fzf]
  nnoremap <c-p> :Files<cr>
  
" Ctrl+f mostra todas ocorrencias de uma palavra no arquivo [usando o plug fzf e o programa the-silver-search (integrado altomaticamente com o fzf)]
  nnoremap <c-f> :Ag<space>
  
""""""""""""""""""" Miscellaneous: """""""""""""""""""""
Plug 'mhinz/vim-startify' " The fancy start screen for Vim

"Plug 'terryma/vim-multiple-cursors' " True Sublime Text style multiple selections for Vim

"Plug 'powerman/vim-plugin-AnsiEsc' " ANSI escape code support for documentation

"Plug 'bling/vim-bufferline' " Super simple vim plugin to show the list of buffers in the command bar
  "let g:airline#extensions#bufferline#enabled = 1
  
"Plug 'cohama/lexima.vim' " Auto close parentheses and repeat by dot dot dot...

""""""""""""""""""""""" Customization: """"""""""""""""""""""" 
Plug 'tpope/vim-flagship'
  set laststatus=2
  set showtabline=2
  set guioptions-=e
  let g:tablabel =
        \ "%N%{flagship#tabmodified()} %{flagship#tabcwds('shorten',',')}"
  autocmd User Flags call Hoist("buffer", "fugitive#statusline")

Plug 'ryanoasis/vim-devicons'
  set encoding=UTF-8

Plug 'jpalardy/spacehi.vim' " Press F3 to color the spaces

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

" Apos apertar o leader e o comando ele executa a segunda sequencia
nnoremap <leader>; A;<esc>
" Abre o init.vim 
nnoremap <leader>ie :e ~/.config/nvim/init.vim<cr>  
nnoremap <leader>is :e ~/.config/nvim/UltiSnips/
" Carrega o arquivo na memoria
nnoremap <leader>ir :source ~/.config/nvim/init.vim<cr>  
" Organizar buffers
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>

" Re-map the buffers <Leader>b<number>b<new number>
" Use the <Leader><number> to acess
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
