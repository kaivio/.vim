" 暂时用不到的配置片段
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
