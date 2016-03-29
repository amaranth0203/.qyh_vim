set encoding=utf-8
let $LANG='zh_CN.UTF-8'
set guifont=Consolas:h14:b:cANSI
set guioptions-=m
set guioptions-=T

au BufWritePre * :set binary | set noeol
au BufWritePost * :set nobinary | set eol
colo desert
set nocompatible
set expandtab
set backspace=indent,eol,start
set number
syntax on
set shiftwidth=4
set tabstop=4
set autochdir
map! <s-tab> <BS><BS><BS><BS>
set ruler

set nobackup
set nowritebackup
set noswapfile

" for Cscope
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" for NERD Commenter
"autocmd VimEnter * :filetype plugin on
autocmd BufRead * :filetype plugin on

set showcmd
set title
set hlsearch
set incsearch
nnoremap <c-\> :nohlsearch<cr>
if has( "win32" ) || has( "win16" )
    nnoremap <A-j> jzz
    nnoremap <A-k> kzz
    set termencoding=gbk
else
    nnoremap <esc>j jzz
    nnoremap <esc>k kzz
    set termencoding=utf-8
endif
nnoremap % %zz


" set default 'runtimepath' (without ~/.vim folders)
let &runtimepath = printf('%s/vimfiles,%s,%s/vimfiles/after', $VIM, $VIMRUNTIME, $VIM)
" what is the name of the directory containing this file?
let s:portable = expand('<sfile>:p:h')
" add the directory to 'runtimepath'
let &runtimepath = printf('%s,%s,%s/after', s:portable, &runtimepath, s:portable)
let mapleader=","

