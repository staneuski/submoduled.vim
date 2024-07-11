" vim:fileencoding=utf-8:foldmethod=marker

if exists('g:packadd_umbrella_interface')
  finish
else
  let g:packadd_umbrella_interface = v:true
endif

": Mouse support
set mouse=a
set ttymouse=sgr
if v:version > 800
  set balloonevalterm
endif

": Show relative line numbers
set number relativenumber

": Set regular expression engine automatically
" set regexpengine=0
