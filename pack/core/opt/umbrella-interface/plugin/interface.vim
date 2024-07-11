" vim:fileencoding=utf-8:foldmethod=marker

if exists('g:umbrella_interface')
  finish
else
  let g:umbrella_interface = 'yes'
endif

": Mouse support
set mouse=a
set ttymouse=sgr
if v:version > 800
  set balloonevalterm
endif

": Show relative line numbers
set relativenumber

": Set regular expression engine automatically
" set regexpengine=0
