"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""" RUNTIME """"""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"if(!exists('g:vscode'))
runtime! src/plugins.vim
"endif
runtime! src/configs.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""" FILE TYPE EXTENSION """""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

au BufRead,BufNewFile *.ex set filetype=elixir
au BufRead,BufNewFile *.exs set filetype=elixir

au FileType elm set tabstop=4
au FileType elm set shiftwidth=4
au FileType elm set expandtab
