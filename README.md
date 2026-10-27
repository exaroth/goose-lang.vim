## goose-lang.vim

This plugin adds support for [Goose](https://aardappel.github.io/goose/index.html) programming language for Vim and NeoVim including syntax highlighting, indentation and rudimentary compiler integration.

### Installation

- via `Vundle`:

Add `Plugin 'exaroth/goose-lang.vim'` line to your `.vimrc`, restart Vim and execute `:BundleInstall`.

- via `Plug`

Add `Plug 'exaroth/goose-lang.vim'` inside the `plug` command:
```vim
call plug#begin('~/.vim/plugged')
    Plug 'exaroth/goose-lang.vim'
call plug#end()
```
Restart Vim, execute `:PlugInstall`

### Compiler support

Plugin supports rudimentary support for goose compiler via `goose build` command, to compile current file execute `:make`, make sure `goose` compiler is in `$PATH` or set `g:goose_compiler_path` variable.

For LSP integration see [https://github.com/aardappel/goose/blob/master/docs/editors.md#neovim](https://github.com/aardappel/goose/blob/master/docs/editors.md#neovim).

### Global configuration options

- `goose_compiler_path` - Path to goose compiler (optional), set if compiler is not in `$PATH`.
- `goose_use_default_make` - Set it to 1 to use default target defined in `Makefile` instead of running goose `build` command directly when executing `:make` command.
- `goose_build_makeprg_params` - Any additional arguments to pass to goose `build` command.
- `goose_build_and_run` - Use `run` command instead of `build` when executing `:make`
### License

See `LICENCE` for details.
