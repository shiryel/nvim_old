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

""""""""""""""""""""""" Integration: """"""""""""""""""""""" 
Plug 'sheerun/vim-polyglot' " A solid language pack for Vim (syntax, ident, compiler, etc...)
Plug 'slashmili/alchemist.vim' " Elixir Integration
Plug 'c-brenn/phoenix.vim' " phoenix.vim: rails.vim inspired tools for Phoenix
                           " gf -> juml | :Pserver | :Ppreview
Plug 'tpope/vim-projectionist' " required for some navigation features in phoenix

"" Completion and liting
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
  let g:deoplete#enable_at_startup = 1

if !has("python3")
  echo "python3 missing"
  echo "run: pip3 install --user pynvim"
  echo "then run on vim: :UpdateRemotePlugins"
endif

""""""""""""""""""""""" Miscellaneous: """"""""""""""""""""""" 
Plug 'mmorearty/elixir-ctags' " ctags -R to build
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
    
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""" VIM CONFIGS """"""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab " Tabs viram 2 espaços
