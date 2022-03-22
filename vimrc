

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'Yggdroot/indentLine'
Plugin 'preservim/nerdtree'
Plugin 'yianwillis/vimcdoc'
" 配色
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'

" 自动补全
Plugin 'ycm-core/YouCompleteMe'
" Track the engine.

" 代码片段
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'kaivio/vim-snippets'

" markdown
Plugin 'godlygeek/tabular'
Plugin 'preservim/vim-markdown'

call vundle#end()
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

autocmd vimenter * ++nested colorscheme gruvbox
set background=dark

" 配置YCM
set ofu=syntaxcomplete#Complete
" imap <silent>  ` <C-X><C-O>
" imap <c-space> <c-x><c-o>
" let g:ycm_semantic_triggers =  {'*': [ 're!\w{2}' ],}
"let g:ycm_semantic_triggers =  {
"  \'javascript': [ 're!\w{2}' ],
"  \ }
let g:ycm_semantic_triggers =  {
      \ 'c,cpp,python,perl,lua,sh': ['re!\w{2}'],
      \ 'html,css,scss,sass,javascript': ['re!\w{2}'],
      \ }
" 关闭文档预览
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

autocmd Filetype json let g:indentLine_enabled = 0
"autocmd Filetype markdown let g:indentLine_enabled = 0

" 设置制表符宽度 和 用空格代替
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent

set nu
set cul

" 单词内不折行
set linebreak

" 开启代码折叠
set foldmethod=indent
set nofoldenable

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

set timeout ttimeoutlen=50


