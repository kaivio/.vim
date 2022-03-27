" 加载插件配置
source ~/.vim/plugin.vim

" 加载用户命令 ; => :K
source ~/.vim/k.vim

" 加载实验配置
source ~/.vim/lab.vim
source ~/.vim/tube.vim

"== 键 码 修 复 ===========================
if !has('nvim')
  source ~/.vim/define-esc.vim
  " set term=xterm-256color
  " let $TERM="xterm-256color"
  " let $TERM="screen-256color"
endif
"
"''''''
set timeout
set ttimeout
set timeoutlen=3000
set ttimeoutlen=-1
au InsertEnter * setlocal timeoutlen=1
au InsertLeave * setlocal timeoutlen=3000

imap <F1> <ESC>
cmap <F1> <c-u>echo "Normal"<CR>
map <F1> :<c-u>echo "Normal"<C:>


"== 通用配置 ==============================
" 设置制表符宽度 和 用空格代替
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent

" 显示行号/光标/命令回显
set nu
set cul
set showcmd

" 单词内不折行
set linebreak

" 开启代码折叠
set foldmethod=indent
set nofoldenable

" 显示不可见字符
set list
set lcs=tab:↹>,trail:□,extends:>,precedes:<,nbsp:■

" 终端选项
set termguicolors
set title
