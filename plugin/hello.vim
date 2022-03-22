let s:PLUG_DIR = expand("<sfile>:p:h")

execute 'py3file' . s:PLUG_DIR . '/hello.py'

"在终端上C-/发送C-_
map <C-_>  :py3 comment()<CR>


function! Fmt_html()
  execute '%s/>\([^\n>]\)/>\r\1/g'
  normal gg=G
endfunction

command! FmtHtml call Fmt_html() 

command! ClearEmptyLine execute '%s/\n[\n \t]*/\r/g'

function! FmtJson() abort range 
 
  echo a:firstline a:lastline
  execute a:firstline','a:lastline'!jq .'

endfunction

command! -range=% FmtJson <line1>,<line2>call FmtJson()

