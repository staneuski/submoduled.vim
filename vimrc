" vim:fileencoding=utf-8:foldmethod=marker

": base {{{
packadd umbrella-base
": }}}

": core {{{
packadd umbrella-mappings

": axvr/org.vim
autocmd BufRead,BufNewFile *.org call s:PackAddOrg()
function! s:PackAddOrg()
  if !exists("g:packadd_opt_org") || !g:packadd_opt_org
    packadd org
    let g:packadd_opt_org = v:true
    bufdo e
  endif
endfunction
": }}}

": Syntax {{{
": OpenFOAM
autocmd BufNewFile,BufRead *.orig,*Dict,*Properties,*Properties.*,*Fn,fv* set syntax=cpp
autocmd BufNewFile,BufRead *.pvsm* set syntax=xml
": }}}
