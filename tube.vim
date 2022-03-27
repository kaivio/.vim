map <c-z> :<c-u>qa
inoremap <c-x> <esc>viw

xnoremap <Space> iw
xnoremap <TAB> aW
nnoremap <TAB> E

vnoremap '' "
nnoremap '' "

" 选择/编辑/搜索/替换
onoremap x iw
nnoremap x viw<c-g>
nnoremap <script> v viw
vnoremap <script> <c-f> "fy/<c-r>f
nnoremap <script> <c-f> viw"fy/<c-r>f
nnoremap <script> <c-h> :s/<c-r>"
nnoremap <script> <c-c> :nohlsearch<CR>
xnoremap <script> <bar> I
inoremap <script> <a-bar> <esc><c-v>
nnoremap <script> <bar> <c-v>
xnoremap <bar> <c-v>
xnoremap <cr> _o$b
xnoremap $ $b
nnoremap <script> <a-p> :normal `pp`pjmp<CR>
nnoremap <script> <a-P> :normal `pP`pjmp<CR>

" 递增复制                 <c-x>
nnoremap + :normal mpyyp`pj<c-a><CR>
nnoremap <a-+> :<c-u>exec "normal viw".v:count1."j<c-v>g<c-a>"<CR>




"== 测 试 指 令 ===========================
au FileType vim inoreabbr <buffer> cr <lt>CR>
au FileType vim inoreabbr <buffer> esc <lt>ESC>

noremap 你好 :echo 'hello'<CR>
noremap <c-F8> :echo 'c-F8 working'<CR>
noremap <a-F8> :echo 'a-F8 working'<CR>
map <c-a-F8> :echo 'c-a-F7 working'<CR>
nnoremap <a-x> :echo 'hello x'<CR>

nmap <A-Left> <S-Left>
vmap <A-Left> <S-Left>
imap <A-Left> <S-Left>
cmap <A-Left> <S-Left>

nmap <A-Right> <S-Right>
vmap <A-Right> <S-Right>
imap <A-Right> <S-Right>
cmap <A-Right> <S-Right>

nmap <A-Up> <S-Up>
vmap <A-Up> <S-Up>
imap <A-Up> <S-Up>
cmap <A-Up> <S-Up>

nmap <A-Down> <S-Down>
vmap <A-Down> <S-Down>
imap <A-Down> <S-Down>
cmap <A-Down> <S-Down>

func SomeText()
  if &ft == ""
    %!curl -fsSL http://httpbin.org/image/svg
    set ft=svg
  else
    echo "_"
  endif
endf

finish

"screevn-257color"
