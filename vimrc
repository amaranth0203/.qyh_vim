set encoding=utf-8
let $LANG='zh_CN.UTF-8'
set guifont=Consolas:h12:cANSI
set linespace=0
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

set showcmd
set title
set hlsearch
set incsearch
function Qyh_j( )
    if line( '.' ) > winheight( 0 ) / 2
        return "j"
    else
        return "j"
endfunction
nnoremap <expr>j Qyh_j( ) 
nnoremap k k
nnoremap <c-\> :set nohlsearch<cr>
nnoremap * *<S-n>:set hls<cr>zz
if has( "win32" ) || has( "win16" )
    nnoremap <A-j> j
    nnoremap <A-k> k
    nnoremap <A-\> :set hls<cr>
    nmap <A-p> :bp<cr>
    nmap <A-n> :bn<cr>
    set termencoding=gbk
else
    nnoremap <esc>j j
    nnoremap <esc>k k
    nnoremap <esc>\ :set hls<cr>
    nmap <esc>p :bp<cr>
    nmap <esc>n :bn<cr>
    set termencoding=utf-8
endif
nnoremap % %zz

" for Cscope
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" for TList
nmap <leader>tl :TlistToggle<cr>

" for NERDTree
nmap <leader>ne :NERDTreeToggle<cr>

" for NERD Commenter
au BufRead * :filetype plugin on
let NERDSpaceDelims=1

" for airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '-'
let g:airline#extensions#tabline#right_sep = '-'
set laststatus=2

function! AutoLoadCTagsAndCScope()
    let max = 10
    let dir = getcwd( ).'/'
    let i = 0
    let break = 0
    while isdirectory(dir) && i < max
        if filereadable(dir . 'GTAGS')
            execute 'cs add ' . dir . 'GTAGS ' . glob("`pwd`")
            let break = 1
        endif
        if filereadable(dir . 'cscope.out')
            execute 'cs add ' . dir . 'cscope.out ' . strpart( dir , 0 , strlen( dir ) - 1 ) 
            "echom 'cs add ' . dir . 'cscope.out ' . strpart( dir , 0 , strlen( dir ) - 1 ) 
            let break = 1
        endif
        if filereadable(dir . 'tags')
            execute 'set tags =' . dir . 'tags'
            "echom dir.'tags'
            let break = 1
        endif
        if break == 1
            execute 'lcd ' . dir
            break
        endif
        let dir = dir . '../'
        let i = i + 1
    endwhile
endf
nmap <F7> :call AutoLoadCTagsAndCScope()<CR>

" set default 'runtimepath' (without ~/.vim folders)
let &runtimepath = printf('%s/vimfiles,%s,%s/vimfiles/after', $VIM, $VIMRUNTIME, $VIM)
" what is the name of the directory containing this file?
let s:portable = expand('<sfile>:p:h')
" add the directory to 'runtimepath'
let &runtimepath = printf('%s,%s,%s/after', s:portable, &runtimepath, s:portable)