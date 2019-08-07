"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""" PLUGINS """""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin()

""""""""""""""""""""""" Language Suport: """"""""""""""""""""""" 
Plug 'elmcast/elm-vim'
" Requirements:
" yarn global add elm           # base
" yarn global add elm-test      # run unit tests
" yarn global add elm-oracle    # code completion and doc lookups
" yarn global add elm-format    # automatically format

" Usage:
" :help elm-vim

""""""""""""""""""""""""""" Completion: """"""""""""""""""""""""
Plug 'dense-analysis/ale'
Plug 'vim-syntastic/syntastic'
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:elm_syntastic_show_warnings = 1
    
Plug 'ycm-core/YouCompleteMe' 
    let g:ycm_semantic_triggers = {
        \ 'elm' : ['.'],
        \}

" TODO: add deoplete?
        
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""" VIM CONFIGS """""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab " Tabs viram 4 espaços

:let maplocalleader = "\<space>\<space>"
