if exists("current_compiler")
    finish
endif

if exists('g:goose_use_default_make')
    if g:goose_use_default_make == 1
        finish
    endif
endif

let current_compiler = "goose"

let s:save_cpo = &cpo
set cpo&vim

if exists(":CompilerSet") != 2
    command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=goose\ $*\ \"%\"

let &cpo = s:save_cpo
unlet s:save_cpo
