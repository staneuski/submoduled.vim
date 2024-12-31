" vim:fileencoding=utf-8:foldmethod=marker

": core plugins {{{
": junegunn/rainbow_parentheses
autocmd VimEnter * RainbowParentheses
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
": }}}

": Syntax {{{
": OpenFOAM
autocmd BufNewFile,BufRead *.orig,*Dict,*Properties,*Properties.*,*Fn,fv* set syntax=cpp
autocmd BufNewFile,BufRead *.eb set syntax=python
autocmd BufNewFile,BufRead *.pvsm* set syntax=xml
": }}}
