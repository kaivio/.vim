
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" jsx 语法高亮
Plugin 'maxmellon/vim-jsx-pretty'

" 缩进线 
Plugin 'Yggdroot/indentLine'

" 树形导航(未启用)
" Plugin 'preservim/nerdtree'
" 中文文档 
Plugin 'yianwillis/vimcdoc'

" 快速注释
Plugin 'preservim/nerdcommenter'

" 配色主题 
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'

" 自动补全
Plugin 'ycm-core/YouCompleteMe'
" 代码片段引擎
Plugin 'SirVer/ultisnips'
" 代码片段定义库
Plugin 'kaivio/vim-snippets'

" markdown
Plugin 'godlygeek/tabular'
Plugin 'preservim/vim-markdown'

" Plugin 'lymslive/autoplug'

call vundle#end()

" call autoplug#load()
" PI qcmotion

"== 配色主题 ============================ 
autocmd vimenter * ++nested colorscheme gruvbox
set background=dark

"== 插件快捷键配置 ======================  


" 代码片段
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" 快速注释
imap <c-/> <c-_>
map <c-/> <c-_>
imap <silent> <c-_> <ESC>:<CR>mc:call nerdcommenter#Comment("n", "Toggle")<CR>`ca
map <silent> <c-_> :call nerdcommenter#Comment("n", "Toggle")<CR>

"== 插件选项 ==============================

" 缩进线插件会隐藏json的双引号，就此阻止
let g:vim_json_conceal=0
let g:markdown_syntax_conceal=0
au FileType help IndentLinesToggle


" 代码片段  
" 编辑命令  :UltiSnipsEdit 
let g:UltiSnipsEditSplit="vertical"
" 识别文件类型 (插件内部有时没自动识别)
autocmd BufReadPre *.snippets set ft=snippets

" 快速注释
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



"== YCM配置 (迷一般的配置) ===============
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
" 启用基于语法 (不太好用)
if &filetype != 'vim'
  let g:ycm_seed_identifiers_with_syntax = 1
endif
" 关闭文档预览
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0


