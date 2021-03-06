" ============================================================================
" File:        execute_menuitem.vim
" Description: plugin for NERD Tree that provides an execute menu item, that
"              executes system default application for file or directory
" Maintainer:  Ivan Tkalin <itkalin at gmail dot com>
" Last Change: 27 May, 2010
"
" hack in:     change the explorer to cmd /k cd /d to start a cmd window in
"              windows by qiyunhu at 06 May, 2016
" ============================================================================
if exists("g:loaded_nerdtree_shell_exec_menuitem")
  finish
endif

let g:loaded_nerdtree_shell_exec_menuitem = 1
let s:haskdeinit = system("ps -e") =~ 'kdeinit'
let s:hasdarwin = system("uname -s") =~ 'Darwin'

call NERDTreeAddMenuItem({
      \ 'text': 'e(x)ecute',
      \ 'shortcut': 'x',
      \ 'callback': 'NERDTreeExecute' })

function! NERDTreeExecute()
  let l:oldssl=&shellslash
  set noshellslash
  let treenode = g:NERDTreeFileNode.GetSelected()
  let path = treenode.path.str()

  if has("gui_running")
    let args = shellescape(path,1)." &"
  else
    let args = shellescape(path,1)." > /dev/null"
  end

  if has("win32unix")
    exe "silent !mintty.exe -e /bin/xhere /bin/bash.exe ".shellescape( path , 1 )
  elseif has("unix") && executable("gnome-open") && !s:haskdeinit
    exe "silent !gnome-open ".args
    let ret= v:shell_error
  elseif has("unix") && executable("kde-open") && s:haskdeinit
    exe "silent !kde-open ".args
    let ret= v:shell_error
  elseif has("unix") && executable("open") && s:hasdarwin
    exe "silent !open ".args
    let ret= v:shell_error
  elseif has("win32") || has("win64")
    exe "silent !start cmd /k cd /d ".shellescape(path,1)
  end
  let &shellslash=l:oldssl
  redraw!
endfunction