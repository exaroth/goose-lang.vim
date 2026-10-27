if exists('current_compiler')
  finish
endif

if get(g:, 'goose_use_default_make', 0)
    finish
endif

runtime compiler/goose.vim


let s:save_cpo = &cpo
set cpo&vim

let current_compiler = 'goose'

if exists("g:goose_compiler_path")
    let current_compiler = g:goose_compiler_path
endif

if exists(':CompilerSet') != 2
  command -nargs=* CompilerSet setlocal <args>
endif

let compiler_cmd = 'CompilerSet makeprg='.current_compiler
if get(g:, 'goose_build_and_run', 0)
    let compiler_cmd = compiler_cmd.'\ run'
else
    let compiler_cmd = compiler_cmd.'\ build'
endif

if exists('g:goose_build_makeprg_params')
    let compiler_cmd = compiler_cmd.'\ '.escape(g:goose_build_makeprg_params, ' \|"').'\ $*\ \"%\"'
else
    let compiler_cmd = compiler_cmd.'\ $*\ \"%\"'


endif
execute 'CompilerSet makeprg='.compiler_cmd

let &cpo = s:save_cpo
unlet s:save_cpo
