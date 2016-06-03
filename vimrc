let $LANG='zh_CN.UTF-8'

" [+] bundle start
set nocompatible              " be iMproved, required
filetype off                  " required

let $rc_folder = expand('<sfile>:p:h')
set rtp+=$rc_folder/bundle/Vundle.vim
call vundle#begin('$rc_folder/bundle')
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
call vundle#end()            " required
filetype plugin indent on    " required
" [+] bundle end

" [+] debug start
fu! Show( )
    verbose set autoindent?
    verbose set smartindent?
    verbose set cindent?
    verbose set indentexpr?
    verbose set expandtab?
endfunction
nmap <leader>ss :call Show( )<cr>
" [+] debug end

au BufWritePre * :set binary | set noeol
au BufWritePost * :set nobinary | set eol
au VimLeave * call SaveSess( )
au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

syntax on
set encoding=utf-8
set fileencodings=utf-8,gb2312,gbk,gb18030
"set guifont=Consolas:h12:cANSI
set guifont=Consolas_for_Powerline_FixedD:h12:cANSI
set linespace=-2
set guioptions-=m
set guioptions-=T
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set nocompatible
set expandtab
set backspace=indent,eol,start
set number
set shiftwidth=4
set tabstop=4
set autochdir
set ruler
set nobackup
set nowritebackup
set noswapfile
set showcmd
set title
set hlsearch
set incsearch
set nowrap
set noautoindent
set guicursor=n-v-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175,a:blinkwait100-blinkoff100-blinkon100
set dir-=.

map! <s-tab> <BS><BS><BS><BS>
nnoremap <expr>j Qyh_j( )
nnoremap k k
nnoremap <c-\> :set nohlsearch<cr>
nnoremap * *<S-n>zz
nnoremap % %zz
nmap <F7> :call AutoLoadCTagsAndCScope()<CR>
nmap <C-w><C-w> :call CloseBufWithNERDTree( )<cr>
nmap <C-w>1  :call Win_prop( 1 )<cr>
nmap <C-w>`1 :call Win_prop( -1 )<cr>
nmap <C-w>2  :call Win_prop( 2 )<cr>
nmap <C-w>`2 :call Win_prop( -2 )<cr>
nmap <C-w>3  :call Win_prop( 3 )<cr>
nmap <C-w>`3 :call Win_prop( -3 )<cr>
nmap <leader>b :call Blood_mode( "on" )<cr>
nmap <leader>nb :call Blood_mode( "off" )<cr>
if has( "win32" ) || has( "win16" ) 
    nnoremap <A-j> j
    nnoremap <A-k> k
    nnoremap <A-\> :set hls<cr>
    nmap <A-h> :bp<cr>
    nmap <A-l> :bn<cr>
    map! <A-q> <C-c>
    vmap <A-q> <C-c>
    vmap <A-f> y:set nomagic<cr>/<C-R>"<cr>:set magic<cr><S-n>zz
    imap <A-s> <esc>:w<cr>
    nmap <A-s> :w<cr>
    nmap <A-y> "+Y
    vmap <A-y> "+y
    vmap <A-Y> "+Y
    nmap <A-p> "+p
    nmap <A-P> "+P
    vmap <A-p> "+P
    imap <A-o> <C-c><S-o>
    nmap <A-o> <S-o>
    imap <A-h> <C-c>bi
    imap <A-l> <C-c>ea
    set termencoding=gbk
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
else
    nnoremap <esc>j j
    nnoremap <esc>k k
    nnoremap <esc>\ :set hls<cr>
    nmap <esc>h :bp<cr>
    nmap <esc>l :bn<cr>
    map! <esc>q <C-c>
    vmap <esc>q <C-c>
    vmap <esc>f y:set nomagic<cr>/<C-R>"<cr>:set magic<cr><S-n>zz
    imap <esc>s <esc>:w<cr>
    nmap <esc>s :w<cr>
    nmap <esc>y "+Y
    vmap <esc>y "+y
    vmap <esc>Y "+Y
    nmap <esc>p "+p
    nmap <esc>P "+P
    vmap <esc>p "+P
    imap <esc>o <C-c><S-o>
    nmap <esc>o <S-o>
    imap <esc>h <C-c>bi
    imap <esc>l <C-c>ea
    set termencoding=utf-8
endif

fu! CloseBufWithNERDTree( )
    if exists( "t:NERDTreeBufName" )
        if bufwinnr( t:NERDTreeBufName ) != -1
            execute "NERDTreeToggle"
            execute "bd"
            execute "NERDTreeToggle"
            execute "wincmd w"
            return
        endif
    endif
    execute "bd"
endfunction

fu! SaveSess( )
    execute 'NERDTreeClose'
    if has( "gui_running" )
        execute 'mksession! ~/qyh_session_gvim.vim'
    else
        execute 'mksession! ~/qyh_session_vim.vim'
    endif
endfunction

fu! LoadSess( )
    if has( "gui_running" )
        execute 'source ~/qyh_session_gvim.vim'
    else
        execute 'source ~/qyh_session_vim.vim'
    endif
endfunction

fu! Win_prop( param )
    if a:param == 1
        execute 'call libcallnr("vimtweak.dll", "SetAlpha", 200)'
    elseif a:param == -1
        execute 'call libcallnr("vimtweak.dll", "SetAlpha", 255)'
    elseif a:param == 2
        execute 'call libcallnr("vimtweak.dll", "EnableMaximize", 1)'
    elseif a:param == -2
        execute 'call libcallnr("vimtweak.dll", "EnableMaximize", 0)'
    elseif a:param == 3
        execute 'call libcallnr("vimtweak.dll", "EnableTopMost", 1)'
    elseif a:param == -3
        execute 'call libcallnr("vimtweak.dll", "EnableTopMost", 0)'
    endif
endfunction

fu! CallNERDTreeDesktop( )
    if has( "win32" ) || has( "win16" )
        execute 'cd ~/Desktop'
    endif
    execute 'NERDTreeToggle'
endfunction

fu! Qyh_j( )
    if line( '.' ) > winheight( 0 ) / 2
        return "j"
    else
        return "j"
    endif
endfunction

fu! AutoLoadCTagsAndCScope()
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
            execute 'set tags +=' . dir . 'tags'
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

fu! Blood_mode( param )
    if a:param == 'on'
        execute 'AirlineTheme distinguished_blood'
        execute 'colo monokai_blood'
    elseif a:param == 'off'
        execute 'AirlineTheme distinguished'
        execute 'colo monokai'
    endif
endf

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
nmap <leader>ne :NERDTree<cr>
nmap <leader>net :call CallNERDTreeDesktop( )<cr>
nmap <leader>nec :ClearBookmarks
nmap <leader>neb :Bookmark

" for NERD Commenter
filetype plugin on
let NERDSpaceDelims=1

" for airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_symbols = {}
let g:airline_symbols.branch = "\u2b60"
let g:airline_symbols.readonly = "\u2b64"
let g:airline_symbols.linenr = "\u2b61"
let g:airline_symbols.whitespace = "!"
let g:airline_powerline_fonts = 1
let g:airline_left_sep = "\u2b80"
let g:airline_left_alt_sep = "\u2b81"
let g:airline_right_sep = "\u2b82"
let g:airline_right_alt_sep = "\u2b83"
let g:airline#extensions#tabline#left_sep = "\u2b80"
let g:airline#extensions#tabline#left_alt_sep = "\u2b81"
let g:airline_theme = "distinguished"

" for GitGutter
let g:gitgutter_enabled = 0 
nmap <leader>gt :GitGutterToggle<cr>
nmap <leader>gh :GitGutterLineHighlightsToggle<cr>
nmap gj :GitGutterNextHunk<cr>
nmap gk :GitGutterPrevHunk<cr>

" for syntastic
let g:syntastic_mode_map = { 'passive_filetypes': ['asm'] }
let g:syntastic_python_checkers = ['python', 'pylint -E']

" set default 'runtimepath' (without ~/.vim folders)
" let &runtimepath = printf('%s/vimfiles,%s,%s/vimfiles/after', $VIM, $VIMRUNTIME, $VIM)
" what is the name of the directory containing this file?
let s:portable = expand('<sfile>:p:h')
" add the directory to 'runtimepath'
" let &runtimepath = printf('%s,%s,%s/after,~/.qyh_vim/bundle/Vundle.vim', s:portable, &runtimepath, s:portable)
let &runtimepath = printf('%s,%s,~/.qyh_vim/bundle/Vundle.vim', s:portable, &runtimepath )
colo monokai