if exists('current_compiler')
  finish
endif

if exists('g:goose_use_default_make') == 1
    if g:goose_use_default_make == 1
        finish
    endif
endif

runtime compiler/goose.vim
let current_compiler = 'goose_build'

let s:save_cpo = &cpo
set cpo&vim


if exists(':CompilerSet') != 2
  command -nargs=* CompilerSet setlocal <args>
endif

if exists('g:goose_build_makeprg_params')
	execute 'CompilerSet makeprg=goose\ build\ '.escape(g:goose_build_makeprg_params, ' \|"').'\ $*\ \"%\"'
else
    CompilerSet makeprg=goose\ build\ $*\ \"%\"
endif

let &cpo = s:save_cpo
unlet s:save_cpo
