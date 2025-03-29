" vim:fileencoding=utf-8:foldmethod=marker

": base plugins {{{
": }}}

": core plugins {{{
": junegunn/rainbow_parentheses
autocmd VimEnter * RainbowParentheses
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
": }}}

": Style {{{
" Enable full colour palette
set t_Co=256
": }}}

": Syntax {{{
": OpenFOAM
autocmd BufNewFile,BufRead *.orig,*Dict,*Properties,*Properties.*,*Fn,fv* set syntax=cpp
autocmd BufNewFile,BufRead *.eb set syntax=python
autocmd BufNewFile,BufRead *.pvsm* set syntax=xml
": }}}
