
"echo 'hello'

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
