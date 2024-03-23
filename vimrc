" vim:fileencoding=utf-8:foldmethod=marker

runtime mappings.vim
runtime interface.vim

": Syntax {{{
": OpenFOAM
autocmd BufNewFile,BufRead *.orig,*Dict,*Properties,*Properties.*,*Fn,fv* set syntax=cpp
autocmd BufNewFile,BufRead *.pvsm* set syntax=xml
": }}}

": General {{{
set history=1000

": Enable filetype plugins
filetype indent plugin on

": Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * silent! checktime
": }}}
