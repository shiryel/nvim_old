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
nnoremap <leader><Leader>p :e ~/.config/nvim/src/plugins.vim<cr>  
nnoremap <leader><Leader>s :e ~/.config/nvim/UltiSnips/
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

" Deselect seach
map <Leader>n :noh<CR>

" Convert existing tabs
nnoremap <Leader><Tab> :retab<CR>

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
set list " show formating characters
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
set foldnestmax=10 " limit the folds in the indent and syntax

set nobackup " no backup file when overwriting
set nowritebackup " no make backup before overwriting
set swapfile " enable swapfile (dont use it with confidential information, that even root must not be able to acess!)
set hidden " buffer continue to exists when the file is abandoned
set history=100 " history of the : commands
set path+=** " list of directories which will be searched when using the |gf|, [f, ]f, ^Wf, |:find|, |:sfind|, |:tabfind| and other commands
set splitbelow " default split below
set diffopt=vertical " default diff split in the vertical

" completion menu
set completeopt=menu,menuone,preview,noselect,noinsert

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""" PLUGINS """""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""" Snippets: """"""""""""""""""""""" 
  " Trigger configuration. Do not use <tab> if you use
  " https://github.com/Valloric/YouCompleteMe.
"  let g:UltiSnipsExpandTrigger="<c-tab>"
"  let g:UltiSnipsJumpForwardTrigger="<c-q>"
"  let g:UltiSnipsJumpBackwardTrigger="<c-w>"
  let g:UltiSnipsSnippetsDir = '~/.config/nvim/UltiSnips' " Diretorio dos snippets
"  let g:UltiSnipsEditSplit="vertical" " If you want :UltiSnipsEdit to split your window.

""""""""""""""""""""""" For Git: """"""""""""""""""""""" 
  " To not open files and other buffers on NerdTree window
  autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif

""""""""""""""""""""" Lightline-bufferline """""""""""""

"let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
"let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
"let g:lightline.component_type   = {'buffers': 'tabsel'}

""""""""""""""""""""""" NerdTree: """"""""""""""""""""""
  nmap <F6> :NERDTreeToggle<CR>
  let NERDTreeShowHidden=1

""""""""""""""""""""""" FZF: """""""""""""""""""
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
  
""""""""""""""""""""" Motion: """"""""""""""""""""""""""
  let g:sneak#label = 1

""""""""""""""""""""""" Snippets: """""""""""""""""""""""""""""""""
"call deoplete#custom#source('ultisnips', 'matchers', ['matcher_fuzzy'])

"""""""""""""""""""""""" COC: """""""""""""""""""""""""""""""""""""

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
"set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> (i mode) to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
"inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" [coc dianost prev/next]
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> <leader>[ <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>] <Plug>(coc-diagnostic-next)

" Remap keys for gotos
" [coc Goto Definition]
nmap <silent> <leader>gd <Plug>(coc-definition)
" [coc Goto Type]
nmap <silent> <leader>gt <Plug>(coc-type-definition)
" [coc Goto Implementation]
nmap <silent> <leader>gi <Plug>(coc-implementation)
" [coc Goto References]
nmap <silent> <leader>gr <Plug>(coc-references)

" Use gh to show documentation in preview window
nnoremap <silent> <leader>h :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" [Rename]
" Remap for rename current word
nmap <leader>r <Plug>(coc-rename)

" [Format]
" Remap for format selected region
xmap <leader>f <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" [CocAction]
" Remap for do codeAction of selected region, ex: `<leader>AAp` for current paragraph
xmap <leader>ca <Plug>(coc-codeaction-selected)
" Remap for do codeAction of current line
nmap <leader>ca  <Plug>(coc-codeaction)

" [CocFix]
" Fix autofix problem of current line
nmap <leader>cf  <Plug>(coc-fix-current)

" [I/A Funcobj]
" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" [range]
" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" [Coc Diagnostic]
" Show all diagnostics
nnoremap <silent> <leader>cd :<C-u>CocList diagnostics<cr>
" [Coc Extensions]
" Manage extensions
nnoremap <silent> <leader>ce :<C-u>CocList extensions<cr>
" [Coc Commands]
" Show commands
nnoremap <silent> <leader>cc :<C-u>CocList commands<cr>
" [Coc Outline]
" Find symbol of current document
nnoremap <silent> <leader>co :<C-u>CocList outline<cr>
" [Coc Symbols]
" Search workspace symbols
nnoremap <silent> <leader>cs :<C-u>CocList -I symbols<cr>
" [Coc Next]
" Do default action for next item.
nnoremap <silent> <leader>cj :<C-u>CocNext<CR>
" [Coc Previous]
" Do default action for previous item.
nnoremap <silent> <leader>ck :<C-u>CocPrev<CR>
" [Coc list Resume]
" Resume latest coc list
nnoremap <silent> <leader>cr :<C-u>CocListResume<CR>
