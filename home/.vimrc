" " colemak
" set langmap=sd,fe,tf,dg,ui,nj,ek,il,kn,yo,\\;p,pr,rs,gt,lu,jy,SD,FE,TF,DG,UI,NJ,EK,IL,KN,YO,:P,PR,RS,GT,LU,JY,o\\;,O:

" get control-j back, so switch it with ctrl-n at qwerty position of j
imap <c-n> <cr>
cmap <c-n> <cr>
inoremap <c-j> <c-n>
cnoremap <c-j> <c-n>

" rotate some keys about to get qwerty "hjkl" back for movement
map m <left>
map n <down>
map e <up>
nmap i <right>
vmap i <right>

map <c-e> <c-y>
map <c-n> <c-e>
" move these keys to their qwerty positions because they are
" in the way of hjkl (and E for J)
noremap k n
noremap K N
noremap u i
noremap U I
noremap l u
noremap L U
noremap N J
noremap E K
noremap I L

" vmap l u
" vmap L U
" map f e
" map F E
" map t f
" map T F
" map j t
" map J T

" this is the only key that isn't in qwerty or colemak position
noremap f e
noremap F E
noremap t f
noremap T F
noremap j t
noremap J T

" window movement
nnoremap <c-w>m <c-w>h
nnoremap <c-w>n <c-w>j
nnoremap <c-w>i <c-w>l
nnoremap <c-w>e <c-w>k

" qwerty <c-w>n and <c-w>i stolen but do nothing so map back
nnoremap <c-w>k <c-w>n
nnoremap <c-w>l <c-w>i

" pentadactyl binds ctrl-h to history otherwise
map <c-h> <BS>
cmap <c-h> <BS>

" this nerdtree mapping interferes with movement
let g:NERDTreeMapOpenExpl = "j"
