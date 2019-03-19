" C-] -> go to definition
" K -> open documentation
" C-X or C-O autocomplete with deoplete

"" Integrations
" Mix: :Mix -> ex: :Mix test
" IEx: :IEx
" Phoenix: use gf to jump between files, :h phoenix for more

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""" PLUGINS """""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin()

""""""""""""""""""""""" Themes: """"""""""""""""""""""" 
" Plug 'morhetz/gruvbox' " gruvbox

" Plug 'joshdick/onedark.vim' " onedark

Plug 'tomasiser/vim-code-dark' " codedark

""""""""""""""""""""""" Language Suport: """"""""""""""""""""""" 
Plug 'sheerun/vim-polyglot' " Language suport on demand

Plug 'c-brenn/phoenix.vim' " To jump between files
Plug 'tpope/vim-projectionist' " required for some navigation features

""""""""""""""""""""""" Completion And Liting: """"""""""""""""""""""" 
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Dark powered asynchronous completion framework
  let g:deoplete#enable_at_startup = 1
  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

Plug 'neomake/neomake' " Asynchronous linting and make framework; Neomake is a plugin for Vim/Neovim to asynchronously run programs.<Paste>
  let g:neomake_markdown_enabled_makers = [] " Don't tell to use smartquotes in markdown
  augroup neomake
    autocmd! BufWritePost * Neomake " Run Neomake when I save any buffer
  augroup END
  "
  "" FOR ELIXIR:
  " Configure a nice credo setup, courtesy https://github.com/neomake/neomake/pull/300
  let g:neomake_elixir_enabled_makers = ['mycredo']
  function! NeomakeCredoErrorType(entry)
    if a:entry.type ==# 'F'      " Refactoring opportunities
      let l:type = 'W'
    elseif a:entry.type ==# 'D'  " Software design suggestions
      let l:type = 'I'
    elseif a:entry.type ==# 'W'  " Warnings
      let l:type = 'W'
    elseif a:entry.type ==# 'R'  " Readability suggestions
      let l:type = 'I'
    elseif a:entry.type ==# 'C'  " Convention violation
      let l:type = 'W'
    else
      let l:type = 'M'           " Everything else is a message
    endif
    let a:entry.type = l:type
  endfunction
  let g:neomake_elixir_mycredo_maker = {
        \ 'exe': 'mix',
        \ 'args': ['credo', 'list', '%:p', '--format=oneline'],
        \ 'errorformat': '[%t] %. %f:%l:%c %m,[%t] %. %f:%l %m',
        \ 'postprocess': function('NeomakeCredoErrorType')
        \ }
  "let g:neomake_elixir_enabled_makers = ['mix', 'credo']
  " TODO?: substituir credo pelo nome do projeto

""""""""""""""""""""""" Languages For Deoplete: """"""""""""""""""""""" 
" Language Server Protocol:
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
  " Required for operations modifying multiple buffers like rename.
  set hidden
  let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ }
  nnoremap <F5> :call LanguageClient_contextMenu()<CR>
  " Or map each action separately
  nnoremap <silent> J :call LanguageClient#textDocument_hover()<CR>
  nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
  nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

Plug 'slashmili/alchemist.vim' " Elixir

Plug 'deoplete-plugins/deoplete-jedi' " Python

" TODO: add ELM support

""""""""""""""""""""""" Snippets: """"""""""""""""""""""" 
Plug 'SirVer/ultisnips' " The ultimate snippet solution for Vim
Plug 'honza/vim-snippets' " ultisnips engine
  " Trigger configuration. Do not use <tab> if you use
  " https://github.com/Valloric/YouCompleteMe.
  let g:UltiSnipsExpandTrigger="<c-tab>"
  let g:UltiSnipsJumpForwardTrigger="<c-q>"
  let g:UltiSnipsJumpBackwardTrigger="<c-w>"
  let g:UltiSnipsSnippetsDir = '~/.config/nvim/UltiSnips' " Diretorio dos snippets
  let g:UltiSnipsEditSplit="vertical" " If you want :UltiSnipsEdit to split your window.

""""""""""""""""""""""" For Git: """"""""""""""""""""""" 
Plug 'tpope/vim-fugitive' " A Git wrapper so awesome, it should be illegal

Plug 'Xuyuanp/nerdtree-git-plugin' " A plugin of NERDTree showing git status

""""""""""""""""""""""" Bars: """"""""""""""""""""""" 
Plug 'scrooloose/nerdtree' " A tree explorer plugin for vim
  nmap <F6> :NERDTreeToggle<CR>
  "autocmd vimenter * NERDTree

Plug 'majutsushi/tagbar' " Displays tags in a window, ordered by scope
  nmap <F7> :TagbarToggle<CR>

""""""""""""""""""""""" Ctags: """"""""""""""""""""""" 
" Plug 'ludovicchabant/vim-gutentags'
"   let g:gutentags_cache_dir = '~/.tags_cache'

""""""""""""""""""""""" Miscellaneous: """"""""""""""""""""""" 
Plug 'mhinz/vim-startify' " The fancy start screen for Vim

Plug 'terryma/vim-multiple-cursors' " True Sublime Text style multiple selections for Vim

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " [INSTALLER] A command-line fuzzy finder 
Plug 'junegunn/fzf.vim' " A command-line fuzzy finder
  " Ctrl+p navega por arquivo [usando o plug fzf]
  nnoremap <c-p> :Files<cr>
  " Ctrl+f mostra todas ocorrencias de uma palavra no arquivo [usando o plug fzf e o programa the-silver-search (integrado altomaticamente com o fzf)]
  nnoremap <c-f> :Ag<space>

Plug 'vim-airline/vim-airline' " lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline-themes' " A collection of themes for vim-airline
  let g:airline_powerline_fonts = 1
  "let g:airline_symbols.linenr = 'Ξ' " Desbuga o LN

Plug 'powerman/vim-plugin-AnsiEsc' " ANSI escape code support for documentation
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
""""""""""""""""""""""""" PLUGINS SPECIAL CONFIGS """""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""" Snippets: """""""""""""""""""""""""""""""""
call deoplete#custom#source('ultisnips', 'matchers', ['matcher_fuzzy'])

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""" THEME """""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

colorscheme codedark
let g:airline_theme = 'badwolf' " Exclusive theme for airline_theme
"set background=dark

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""" VIM CONFIGS """""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set hidden  " Deixa voce abrir um novo arquivo na mesma tela sem tem que salvar o anterior [mas avisara caso voce tente fechar]
set number  " Mostra os numeros nas linhas
set relativenumber  " Os numeros sao relativos a linha posicinadas *otimo para saltos*
set mouse=a  " Habilita o mouse
set inccommand=split  " Habilita visualizaçao de alteraçoes pelos comandos
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab " Tabs viram 2 espaços

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
""""""""""""""""""""""""" CTAGS """""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" TODO: Add the url in ~/.ctags
" https://raw.githubusercontent.com/mmorearty/elixir-ctags/master/.ctags
" Exclude the tagbar type elixir?
" Verify if ctags is installed

"" Elixir configs for tagsbar plugin
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
