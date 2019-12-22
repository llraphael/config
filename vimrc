set relativenumber
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

" Keep search results at the center of screen
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" Tab control
nnoremap <Leader>tN :tabnew<CR>
nnoremap <Leader>tc :tabclose<CR>
nnoremap <Leader>tm :tabmove<CR>
nnoremap <Leader>tn :tabnext<CR>
nnoremap <Leader>tp :tabprevious<CR>

" Remap keys for gotos
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)

" Mpa jk to ESC in insert mode
inoremap jk <esc>

" File behavior
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype go setlocal tabstop=4 shiftwidth=4 softtabstop=4
" ts - show existing tab with 4 spaces width
" sw - when indenting with '>', use 4 spaces width
" sts - control <tab> and <bs> keys to match tabstop

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

       
" Plugin - managed by vim-plug
" Specify a directory for plugins 
call plug#begin('~/.vim/plugged')

" lightline - vim status bar
Plug 'itchyny/lightline.vim'

" fugitive - vim git wrapper
Plug 'tpope/vim-fugitive'

" vim-go 
Plug 'fatih/vim-go'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'fatih/molokai'

" bazel
"Plug 'google/vim-maktaba'
"Plug 'bazelbuild/vim-bazel'

" direnv
"Plug 'direnv/direnv'

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

" vim-go plugin config
" Run `goimports` on your current file on every save
let g:go_fmt_command = "goimports"
" Status line types/signatures
let g:go_auto_type_info = 1

" :GoDef and :GoInfo use gopls
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
"let g:go_debug=['lsp']

" vim-go highlights different parts of codes
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1

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
