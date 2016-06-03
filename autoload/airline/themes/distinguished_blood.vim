" vim-airline companion theme of distinguished_blood
" (https://github.com/Lokaltog/vim-distinguished_blood)
" I have nothing to do with the original
" distinguished_blood theme other than being a big fan.
" this theme was shamelessly created by modifying
" the Ubaryd airline theme.

let s:gray    = [160, '#df0000']
let s:golden  = [160, '#df0000']
let s:pink    = [160, '#df0000']
let s:blue    = [160, '#df0000']
let s:orange  = [ 52, '#5f0000']
let s:outerfg = [232, '#5f0000']
let s:innerbg = [ 52, '#5f0000']
let s:middle  = ['#ffffff', '#870000', 15, 88]

" Normal mode
let s:N1 = [s:outerfg[1], s:gray[1], s:outerfg[0], s:gray[0]]
let s:N3 = [s:gray[1], s:innerbg[1], s:gray[0], s:innerbg[0]]

" Insert mode
let s:I1 = [s:outerfg[1], s:golden[1], s:outerfg[0], s:golden[0]]
let s:I3 = [s:golden[1], s:innerbg[1], s:golden[0], s:innerbg[0]]

" Visual mode
let s:V1 = [s:outerfg[1], s:pink[1], s:outerfg[0], s:pink[0]]
let s:V3 = [s:pink[1], s:innerbg[1], s:pink[0], s:innerbg[0]]

" Replace mode
let s:R1 = [s:outerfg[1], s:blue[1], s:outerfg[0], s:blue[0]]
let s:R3 = [s:blue[1], s:innerbg[1], s:blue[0], s:innerbg[0]]

" Inactive pane
let s:IA = [s:middle[1], s:innerbg[1], s:middle[3], s:innerbg[0]]

let g:airline#themes#distinguished_blood#palette = {}
let g:airline#themes#distinguished_blood#palette.accents = {
    \ 'red': ['#d70000', '', 160, '', '']}

let g:airline#themes#distinguished_blood#palette.inactive = {
    \ 'airline_a': s:IA,
    \ 'airline_b': s:IA,
    \ 'airline_c': s:IA}

let g:airline#themes#distinguished_blood#palette.normal = airline#themes#generate_color_map(s:N1, s:middle, s:N3)
let g:airline#themes#distinguished_blood#palette.normal_modified = {
    \ 'airline_a': ['', s:orange[1], '', s:orange[0], ''],
    \ 'airline_c': [s:orange[1], '', s:orange[0], '', ''],
    \ 'airline_x': [s:orange[1], '', s:orange[0], '', ''],
    \ 'airline_z': ['', s:orange[1], '', s:orange[0], '']}

let g:airline#themes#distinguished_blood#palette.insert = airline#themes#generate_color_map(s:I1, s:middle, s:I3)
let g:airline#themes#distinguished_blood#palette.insert_modified = {}

let g:airline#themes#distinguished_blood#palette.replace = airline#themes#generate_color_map(s:R1, s:middle, s:R3)
let g:airline#themes#distinguished_blood#palette.replace_modified = {}

let g:airline#themes#distinguished_blood#palette.visual = airline#themes#generate_color_map(s:V1, s:middle, s:V3)
let g:airline#themes#distinguished_blood#palette.visual_modified = {}