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

""""""""""""""""""""""" NerdTree: """"""""""""""""""""""
  nmap <F6> :NERDTreeToggle<CR>
  let NERDTreeShowHidden=1
  "autocmd vimenter * NERDTree

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""" VIM CONFIGS """"""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""" COC: """""""""""""""""""""""""""""""""""""

" if hidden is not set, TextEdit might fail.
" Deixa voce abrir um novo arquivo na mesma tela sem tem que salvar o anterior [mas avisara caso voce tente fechar]
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=3000

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

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

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>AAp` for current paragraph
xmap <leader>A  <Plug>(coc-codeaction-selected)
nmap <leader>A  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>d  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

" Deselect seach
map <Leader><Space> :noh<CR>

" autocmd VimEnter * source ~/.config/nvim/src/plugins.vim
