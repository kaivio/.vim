let s:PLUG_DIR = expand("<sfile>:p:h")
execute 'py3file' . s:PLUG_DIR . '/k.py'

function K(it, ...) abort range
  execute a:firstline.','.a:lastline.'py3 k_'.a:it.'()'
endfunction

function K_complete(...)
  let l:items = ""
  py3 complete_k('l:items')
  return l:items
endfunction

command! -range=% -nargs=* -complete=custom,K_complete K <line1>,<line2>call K(<f-args>) 
map ; :K<Space>
