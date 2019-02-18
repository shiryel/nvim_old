"    NeoVim config file, plugins and configs for NeoVim
"    Copyright (C) 2018 Vinicius Henrique Duarte Molina
"
"    This program is free software: you can redistribute it and/or modify
"    it under the terms of the GNU General Public License as published by
"    the Free Software Foundation, either version 3 of the License, or
"    (at your option) any later version.
"
"    This program is distributed in the hope that it will be useful,
"    but WITHOUT ANY WARRANTY; without even the implied warranty of
"    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
"    GNU General Public License for more details.
"
"    You should have received a copy of the GNU General Public License
"    along with this program.  If not, see <http://www.gnu.org/licenses/>.

call plug#begin()
"" Themes
" Plug 'morhetz/gruvbox' " gruvbox
" Plug 'joshdick/onedark.vim' " onedark
Plug 'tomasiser/vim-code-dark' " codedark

"" Languages
Plug 'sheerun/vim-polyglot' " A solid language pack for Vim (syntax, ident, compiler, etc...)
Plug 'sbdchd/neoformat' " :Neoformat to format a buffer
" Elixir plugins
Plug 'slashmili/alchemist.vim' " Elixir Integration
Plug 'c-brenn/phoenix.vim' " phoenix.vim: rails.vim inspired tools for Phoenix
                           " gf -> juml | :Pserver | :Ppreview
Plug 'tpope/vim-projectionist' " required for some navigation features in phoenix
"Plug 'mmorearty/elixir-ctags' " ctags -R to build
Plug 'jadercorrea/elixir_generator.vim' " :EX -> prompt to include new modules and tests

"" Completion and liting
"Plug 'neomake/neomake' " Asynchronous linting and make framework
"Plug 'Shougo/deoplete.nvim' " Dark powered asynchronous completion framework
" Plug 'roxma/nvim-completion-manager' " [DEPRECATED] Completion Framework
Plug 'w0rp/ale' " Asynchronous linting/fixing for Vim and Language Server Protocol integration
" Complementos para o ale
Plug 'avh4/elm-format'
"Plug 'JakeBecker/elixir-ls'
"Plug 'prettier/prettier'

"" Snippets
Plug 'SirVer/ultisnips' " The ultimate snippet solution for Vim
Plug 'honza/vim-snippets' " Snippet engine

"" For Git
Plug 'tpope/vim-fugitive' " A Git wrapper so awesome, it should be illegal
Plug 'Xuyuanp/nerdtree-git-plugin' " A plugin of NERDTree showing git status

"" Bars
Plug 'scrooloose/nerdtree' " A tree explorer plugin for vim
Plug 'majutsushi/tagbar' " Displays tags in a window, ordered by scope

"" Miscellaneous
Plug 'mhinz/vim-startify' " The fancy start screen for Vim
Plug 'terryma/vim-multiple-cursors' " True Sublime Text style multiple selections for Vim
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " [INSTALLER] A command-line fuzzy finder 
Plug 'junegunn/fzf.vim' " A command-line fuzzy finder
Plug 'cohama/lexima.vim' " Auto close parentheses and repeat by dot dot dot...
Plug 'vim-airline/vim-airline' " lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline-themes' " A collection of themes for vim-airline
"Plug 'bling/vim-bufferline' " Super simple vim plugin to show the list of buffers in the command bar
"
"" Customization
Plug 'tpope/vim-flagship'
Plug 'ryanoasis/vim-devicons'
Plug 'jpalardy/spacehi.vim' " Press F3 to color the spaces
call plug#end()

""" THEME
colorscheme codedark
let g:airline_theme = 'badwolf' " Exclusive theme for airline_theme
"set background=dark

"=========================================================
""" VIM CONFIGS
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

"=========================================================
""" PLUGINS CONFIGS

"" Fzf
" Ctrl+p navega por arquivo [usando o plug fzf]
nnoremap <c-p> :Files<cr>
" Ctrl+f mostra todas ocorrencias de uma palavra no arquivo [usando o plug fzf e o programa the-silver-search (integrado altomaticamente com o fzf)]
nnoremap <c-f> :Ag<space>

"" UltiSnips
let g:UltiSnipsSnippetsDir = '~/.config/nvim/UltiSnips' " Diretorio dos snippets
let g:UltiSnipsEditSplit = 'vertical' " Usa o ultisnips para abrir novos em janela vertical
let g:UltiSnipsJumpForwardTrigger="<tab>"                                       
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsExpandTrigger="<tab>"
"call deoplete#custom#source('ultisnips', 'matchers', ['matcher_fuzzy'])

"" NerdTree 
"autocmd vimenter * NERDTree
nmap <F6> :NERDTreeToggle<CR>

"" TagBar 
nmap <F7> :TagbarToggle<CR>

"" Neomake 
"let g:deoplete#enable_at_startup = 1
"autocmd! BufWritePost * Neomake

"" Alchemist 
let g:alchemist_tag_disable = 1

"" Vim_airline
let g:airline_powerline_fonts = 1
"let g:airline_symbols.linenr = 'Ξ' " Desbuga o LN

"" Bufferline
"let g:airline#extensions#bufferline#enabled = 1

"" vim-flagship
set laststatus=2
set showtabline=2
set guioptions-=e
let g:tablabel =
      \ "%N%{flagship#tabmodified()} %{flagship#tabcwds('shorten',',')}"
autocmd User Flags call Hoist("buffer", "fugitive#statusline")

"" vim-devicons
set encoding=UTF-8

"" ale
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1

"" elm-format / elm-vim
let g:elm_jump_to_error = 0
let g:elm_make_output_file = "elm.js"
let g:elm_make_show_warnings = 0
let g:elm_syntastic_show_warnings = 0
let g:elm_browser_command = ""
let g:elm_detailed_complete = 0
let g:elm_format_autosave = 1
let g:elm_format_fail_silently = 0
let g:elm_setup_keybindings = 1

"=========================================================
""" CTAGS
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
