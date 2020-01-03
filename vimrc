set relativenumber
set number
syntax on

" Change how vim represents characters on the screen
set encoding=utf-8

" Set the encoding of files written
set fileencoding=utf-8

" Flash screen instead of beep sound
set visualbell

" Search
set hlsearch
set smartcase
set incsearch

" Indentation
set smarttab
set linebreak
set tabstop=4
set shiftwidth=4
set autoindent

set backspace=indent,eol,start
" indent  allow backspacing over autoindent
" eol     allow backspacing over line breaks (join lines)
" start   allow backspacing over the start of insert; CTRL-W and CTRL-U
"        stop once at the start of insert.

set colorcolumn=80 "line length constraint"
set foldenable
set showmatch "show matching brackets"

" Allow hidden buffer
set hidden

""""""""""""""""""""""""""""""""""
"""""""""" KEY BINDINGS """"""""""
""""""""""""""""""""""""""""""""""

" Keep search results at the center of screen
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" Tab control
nnoremap tp :tabprevious<CR>
nnoremap tn :tabnext<CR>

" Buffer control
nnoremap bn :bnext<CR>
nnoremap bp :bprevious<CR>

" Window contorl
nnoremap wh <c-w>h
nnoremap wj <c-w>j
nnoremap wk <c-w>k
nnoremap wl <c-w>l

" Map jk to ESC in insert mode
inoremap jk <esc>

" File behavior
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype go setlocal tabstop=4 shiftwidth=4 softtabstop=4

       
"""""""""""""""""""""""""""""""""""""""""" 
"""""""""""""""" Plugin """"""""""""""""""
""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" lightline - vim status bar
Plug 'itchyny/lightline.vim'

" fugitive - vim git wrapper
Plug 'tpope/vim-fugitive'

" vim-go 
Plug 'fatih/vim-go'
Plug 'fatih/molokai'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" direnv
"Plug 'direnv/direnv'

" markdown
Plug 'plasticboy/vim-markdown'

" gruvbox - vim theme
Plug 'morhetz/gruvbox'

" papercolor - vim theme
Plug 'NLKNguyen/papercolor-theme'

" dracula - vim theme
Plug 'dracula/vim',{'as':'dracula'}

" vim-vinegar to enhance netrw
Plug 'tpope/vim-vinegar'

" Initialize plugin system 
call plug#end()

" gruvbox setup
" colorscheme gruvbox
" let g:gruvbox_contrast_dark='hard'

" papercolor setup
"set t_Co=256
"set background=dark
"colorscheme PaperColor

" molokai setup
let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai

" lightline plugin config
let g:lightline = {
  \     'colorscheme': 'OldHope',
  \     'active': {
  \         'left': [['mode', 'paste' ], ['gitbranch', 'readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     },
  \     'component_function': {
  \         'gitbranch': 'fugitive#head'
  \     }
  \ }
set laststatus=2

" ----------------------------------------------------
" Golang Config with vim-go
" ----------------------------------------------------

" Run `goimports` on your current file on every save
let g:go_fmt_command = "goimports"
" Status line types/signatures
let g:go_auto_type_info = 1

" :GoDef and :GoInfo use gopls
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
"let g:go_debug=['lsp']

" disable vim-go :GoDef shortcut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

" vim-go highlights different parts of codes
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1

" ----------------------------------------------------
" coc.nvim default settings 
" ----------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
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

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
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

" Auto-complete by .
"au filetype go inoremap <buffer> . .<C-x><C-o>


" Thrift syntax highlight
au BufRead,BufNewFile *.thrift set filetype=thrift
au! Syntax thrift source ~/.vim/thrift.vim

" netrw configuration
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15

" set cursor based on the mode
:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul
