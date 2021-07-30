"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""" RUNTIME """"""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua require('plugins/_plugins')
lua require('lsp/_lsp')

" Automatically compiles packer
autocmd BufWritePost plugins.lua PackerCompile

" Tree-sitter based folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"if(!exists('g:vscode'))
"runtime! src/plugins.vim
"endif
runtime! src/configs.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""" FILE TYPE EXTENSION """""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
au BufRead,BufNewFile *.eex,*.leex,*.sface set filetype=elixir
au BufRead,BufNewFile mix.lock set filetype=elixir

au FileType elm set tabstop=4
au FileType elm set shiftwidth=4
au FileType elm set expandtab
