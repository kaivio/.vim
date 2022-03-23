
augroup UserDict
  au!
  au InsertCharPre * call UserDict#TrackChange()
  au TextChangedI * call UserDict#TrackChange()
  if exists('##TextChangedP')
    au TextChangedP * call UserDict#TrackChange()
  endif
augroup END
