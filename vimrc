" vim:fileencoding=utf-8:foldmethod=marker

": base plugins {{{
": }}}

": core plugins {{{
": junegunn/rainbow_parentheses
autocmd VimEnter * RainbowParentheses
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
": }}}

": Style {{{
": Enable full colour palette
set t_Co=256

": Theme
set termguicolors
colorscheme tokyonight
": }}}

": filetype {{{
": EasyBuild
autocmd BufNewFile,BufRead *.eb set filetype=python

": OpenFOAM
autocmd BufNewFile,BufRead *.ges,*.slurm set filetype=bash
autocmd BufNewFile,BufRead *.orig,*Dict,*Dict.*,*Properties,*Properties.*,*Fn,fv* set filetype=cpp

": ParaView
autocmd BufNewFile,BufRead *.pvsm* set filetype=xml
": }}}
