if exists("b:did_ftplugin")
  finish
endif

let b:did_ftplugin = 1

let s:cpo_orig = &cpo
set cpo&vim

compiler goose_build


setlocal formatoptions-=t formatoptions+=croql
setlocal suffixesadd=.goose
setlocal iskeyword+=@-@

if has('comments')
    setlocal comments=://!,://
    setlocal commentstring=//\ %s
endif

let &l:define='\v(<fn>|<const>|<var>|<let>|<struct>|<enum>|^\s*\#\s*define)'

if get(g:, 'goose_recommended_style', 1)
    setlocal expandtab
    setlocal softtabstop=4
    setlocal shiftwidth=4
endif

let &cpo = s:cpo_orig
unlet s:cpo_orig
