" vim:fileencoding=utf-8:foldmethod=marker

if exists('g:umbrella_netrw')
  finish
else
  let g:umbrella_netrw = 'yes'
endif

": Hide the banner (use `I` to show)
let g:netrw_banner=0

": Use vertical split by default
let g:netrw_altv=1
let g:netrw_preview=1 " https://groups.google.com/g/vim_use/c/sL_qSu_Tysk?pli=1
let g:netrw_alto=0

let g:netrw_keepdir=0 " https://groups.google.com/g/vim_use/c/6yqU3RX2CWA
let g:netrw_liststyle=3
