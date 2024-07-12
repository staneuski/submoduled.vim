" vim:fileencoding=utf-8:foldmethod=marker

": Syntax {{{
": OpenFOAM
autocmd BufNewFile,BufRead *.orig,*Dict,*Properties,*Properties.*,*Fn,fv* set syntax=cpp
autocmd BufNewFile,BufRead *.pvsm* set syntax=xml
": }}}
