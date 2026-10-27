if exists("current_compiler")
    finish
endif

if get(g:, 'goose_use_default_make', 0)
    finish
endif

let current_compiler = "goose"

if exists("g:goose_compiler_path")
    let current_compiler = g:goose_compiler_path
endif


let s:save_cpo = &cpo
set cpo&vim

if exists(":CompilerSet") != 2
    command -nargs=* CompilerSet setlocal <args>
endif

let compiler_cmd=current_compiler.'\ $*\ \"%\"'
execute 'CompilerSet makeprg='.compiler_cmd

let &cpo = s:save_cpo
unlet s:save_cpo
