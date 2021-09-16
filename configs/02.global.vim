let mapleader = "\<Space>"

filetype plugin on
filetype plugin indent on

set tabstop=2
set softtabstop=0
set shiftwidth=2
set expandtab
set lazyredraw

set ignorecase
set smartcase

set number
set relativenumber

set encoding=UTF-8
set mouse=a

set history=1000
set undolevels=1000

set noswapfile
set nowrap

nnoremap ; :

noremap <silent> <c-k> :wincmd k<CR>
noremap <silent> <c-j> :wincmd j<CR>
noremap <silent> <c-h> :wincmd h<CR>
noremap <silent> <c-l> :wincmd l<CR>

noremap qq :qa<CR>

nnoremap <leader>sp :set spell<cr>
nnoremap <leader>ss :set spell!<cr>
set spelllang=en

"for compile c++
autocmd filetype cpp nnoremap <F9> :w !g++ -std=c++14 ./% -o ./%:r && ./%:r<CR>

"for change size buffer
noremap <leader>. <C-W>>
noremap <leader>, <C-W><
noremap <leader>- <C-W>-
noremap <leader>= <C-W>+

set foldmethod=syntax
autocmd FileType python setlocal foldmethod=indent
set foldcolumn=1
let javaScript_fold=1
set foldlevelstart=99

" Clipboard
vnoremap <silent> y y:call ClipboardYank()<cr>
vnoremap <silent> d d:call ClipboardYank()<cr>
nnoremap <silent> p :call ClipboardPaste()<cr>p
nnoremap <silent> dd dd:call ClipboardYank()<cr>

" Resize buffer
noremap <leader>vu <C-W>+
noremap <leader>vd <C-W>-
noremap <leader>hl <C-W><
noremap <leader>hr <C-W>>

" Auto reload file
set autoread 
au CursorHold * checktime
