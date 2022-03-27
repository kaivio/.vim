

" 为映射 ALT 键做准备
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw
exec "set <Home>=\eOH"
exec "set <A-Space>=\e<Space>"
"
" 在正常模式需要足够的等待时间接收序列
" 但在插入模式下降低字符序列等待时间
" 让其能在瞬间返回正常模式


set timeout
" set ttimeout
" set ttimeoutlen=-1
set timeoutlen=3000
au InsertEnter * set timeoutlen=10
au InsertLeave * set timeoutlen=3000

" 笔  记: 只能为插入模式定义特殊组合键，
"         因为组合键是ESC转义序列，
"         单独按下<ESC>时会进入等待。
"     (!) 除非有个有个热键快速回到正常模式
"
" imap <F1> <ESC>
" cmap <F1> <c-u>echo "Normal"<CR>
" map <F1> :<c-u>echo "Normal"<CR>
