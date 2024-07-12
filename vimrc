" vim:fileencoding=utf-8:foldmethod=marker

": base {{{
packadd umbrella-base
": }}}

": core {{{
packadd umbrella-mappings
": }}}

": Syntax {{{
": OpenFOAM
autocmd BufNewFile,BufRead *.orig,*Dict,*Properties,*Properties.*,*Fn,fv* set syntax=cpp
autocmd BufNewFile,BufRead *.pvsm* set syntax=xml
": }}}
