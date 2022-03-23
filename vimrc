

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'Yggdroot/indentLine'
Plugin 'preservim/nerdtree'
Plugin 'yianwillis/vimcdoc'
Plugin 'preservim/nerdcommenter'
" 配色
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'

" 自动补全
Plugin 'ycm-core/YouCompleteMe'

" 代码片段引擎
Plugin 'SirVer/ultisnips'
" 代码片段定义
Plugin 'kaivio/vim-snippets'

" markdown
Plugin 'godlygeek/tabular'
Plugin 'preservim/vim-markdown'
call vundle#end()

" 代码片段插件
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

autocmd BufReadPre *.snippets set ft=snippets

" YCM 插件
set ofu=syntaxcomplete#Complete
" imap <silent>  ` <C-X><C-O>
" imap <c-space> <c-x><c-o>
" let g:ycm_semantic_triggers =  {'*': [ 're!\w{2}' ],}
"let g:ycm_semantic_triggers =  {
"  \'javascript': [ 're!\w{2}' ],
"  \ }
" -------------------- 
" let g:ycm_semantic_triggers =  {
"       \ 'c,cpp,python,perl,lua,sh': ['re!\w{2}'],
"       \ 'html,css,scss,sass,javascript': ['re!\w{2}'],
"       \ }
" --------------------
"  自动触发补全
let g:ycm_semantic_triggers =  {
      \ '*': ['re!\w{2}'],
      \ }
" 读取标签(tags)文件
let g:ycm_collect_identifiers_from_tags_files = 1
" 基于语法 (不太好用)
" let g:ycm_seed_identifiers_with_syntax = 1
" 关闭文档预览
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

autocmd Filetype json let g:indentLine_enabled = 0
"autocmd Filetype markdown let g:indentLine_enabled = 0


" 注释插件
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" 主题
autocmd vimenter * ++nested colorscheme gruvbox
set background=dark

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


