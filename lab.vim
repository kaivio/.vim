
" 在插入和可视模式下不隐藏字符
" set cocu=nc
autocmd BufEnter *.md set concealcursor=nc

"== 移 动 指 令 ===========================

" double-home (Note: I -> N then col-1)
fun DoubleHome(offset)
  let l:col = col('.')
  normal _
  if l:col+a:offset == col('.')
    normal 0
  endif
endfun

inoremap <silent> <HOME> <ESC>:call DoubleHome(1)<CR>i
nnoremap <silent> <HOME> :call DoubleHome(0)<CR>

imap <F8> <END><CR>
nmap <F8> o<ESC>_d$


"== 操 作 指 令 ===========================
" 清空行
nmap ds _d$
imap <silent> <c-d> <ESC>cc


" 撤销 / 重做
nmap r <c-r>
imap <silent> <c-u> <ESC>:<CR>ua
imap <silent> <c-r> <ESC><c-r>a
imap <silent> <c-z> <ESC>:<CR>ua
imap <silent> <a-z> <ESC><c-r>a

" 增强帮助文件阅读
au FileType help sl 50m| wincmd T
au FileType help setlocal ts=2
au FileType help nmap <buffer> <CR> <C-]>
au FileType help nmap <buffer> <BS> <C-o>
au FileType help hi link Ignore GruvboxFg4

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
imap <A-Space> <c-q>u3000
" 强制插入制表符
imap <c-t> <c-q><tab>

" 分割线(以后写个插件)
au FileType help  imap <A-l> <ESC>:<CR>o<ESC>:<CR>S========================================<CR>
au FileType help  nmap 分割线 :sl 10m<CR> o<ESC>:sl 10m<CR>S========================================<ESC>



"== 测 试 钩 子 ===========================
" 为bin目录添加x模式
au BufWritePost **/bin/** silent !chmod +x %
" 清除行尾空白
au BufWritePre *  py3do return line.rstrip()

au BufEnter * normal `"




