
" 在插入和可视模式下不隐藏字符
" set cocu=nc 
autocmd BufEnter *.md set concealcursor=nc

" 为映射 ALT 键做准备
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw
""""""'"'''
" 在正常模式需要足够的等待时间接收序列
" 但在插入模式下降低字符序列等待时间
" 让其能在瞬间返回正常模式
set timeout 
"set ttimeoutlen=-1
set timeoutlen=2000
au InsertEnter * set timeoutlen=10
au InsertLeave * set timeoutlen=2000

"== 操 作 指 令 ===========================


" double-home
fun DoubleHome()
  let l:col = col('.')
  normal _
  if l:col+1 == col('.')
    normal 0
  endif
endfun

" 插入模式下实用性存疑
inoremap <silent> OH <ESC>:call DoubleHome()<CR>i
nnoremap <silent> OH  :call DoubleHome()<CR>h

imap <F8> <END><CR>


nmap ds _d$
imap <silent> <c-d> <ESC>:<CR>_d$a

" 撤销 / 重做
nmap r <c-r>
imap <silent> <c-u> <ESC>:<CR>ua
imap <silent> <c-r> <ESC><c-r>a
imap <silent> <c-z> <ESC>:<CR>ua
imap <silent> <a-z> <ESC><c-r>a
nmap <c-z> :echo "c-z"

" 增强帮助文件阅读
au FileType help wincmd T
au FileType help nmap <buffer> <CR> <C-]>
au FileType help nmap <buffer> <BS> <C-o>

"== 输 入 指 令 ===========================

" 符号配对输入
inoremap ` ``<LEFT>
inoremap '' ''<LEFT>
inoremap "" ""<LEFT>
inoremap () ()<LEFT>
inoremap [] []<LEFT>
inoremap {} {}<LEFT>

" vim 的特殊符号
au FileType vim imap <buffer> <lt> <lt>><LEFT>
au FileType vim inoremap <buffer> '' "
au FileType vim inoremap <buffer> ' ''<LEFT>

" 保存自动重载
au FileType vim imap <buffer> <c-s> <ESC>:w<CR>:so %<CR>i
au FileType vim nmap <buffer> <c-s> <ESC>:w<CR>:so %<CR>



" 插入全角空格
imap <a-s> <c-q>u3000
execute "imap \e<Space> <c-q>u3000"
" 强制插入制表符
imap <c-t> <c-q><tab>

" 分割线(以后写个插件)
au FileType help  imap <A-l> <ESC>:<CR>o<ESC>:<CR>S========================================<CR>
au FileType help  nmap 分割线 :sl 10m<CR> o<ESC>:sl 10m<CR>S========================================<ESC>


"== 测 试 指 令 ===========================

map 你好 :echo 'hello'<CR>
map x :echo 'hello ttx'<CR>
map xy :echo 'hello tty'<CR>
map xz :echo 'hello txz'<CR>
map <F8> :echo 'F8 working'<CR>
map <c-F8> :echo 'c-F8 working'<CR>
map <a-F8> :echo 'a-F8 working'<CR>
map <c-a-F8> :echo 'c-a-F8 working'<CR>


nmap <a-x> :echo 'hello x'<CR>


"== 测 试 钩 子 ===========================

au BufWritePost **/bin/** !chmod +x %
