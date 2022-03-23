let s:PLUG_DIR = expand("<sfile>:p:h")
execute 'py3file' . s:PLUG_DIR . '/k.py'

function K(line1,line2,it, ...) abort
  execute a:line1.','.a:line2.'py3 k_'.a:it.'()'
endfunction

function K_complete(...)
  let l:items = ""
  py3 complete_k('l:items')
  return l:items
endfunction

command! -range -nargs=* -complete=custom,K_complete K call K(<line1>,<line2>,<f-args>) 
" command! -range -nargs=* -complete=custom,K_complete K <line1>,<line2>call K(<f-args>)
map ; :K<Space>

command! -range=% Test <line1>,<line2>!cat

fun! CompleteMonths(findstart, base)
  if a:findstart
    " 定位单词的开始处
    let line = getline('.')
    let start = col('.') - 1
    while start > 0 && line[start - 1] =~ '\a'
      let start -= 1
    endwhile
    return start
  else
    " 寻找匹配 "a:base" 的月份
    for m in split("Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec")
      if m =~ '^' . a:base
  call complete_add(m)
      endif
      sleep 300m	" simulate searching for next match
      if complete_check()
  break
      endif
    endfor
    return []
  endif
endfun
set completefunc=CompleteMonths
