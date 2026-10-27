" Vim syntax file
" Language: Goose
" Maintainer: Konrad Wasowicz

if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim


" ===== KWD
syntax keyword gooseKeyword type as from namespace in
syntax keyword gooseDecl var let const import
syntax keyword gooseConditional if else switch
syntax keyword gooseRepeat while for match loop
syntax keyword gooseBoolean true false
syntax keyword gooseGuard guard
syntax keyword gooseNull null
syntax keyword gooseStatement return break continue


syntax keyword gooseType bool void type self varint
syntax keyword gooseType u2 u8 u16 f16 f32 f64 f80 f128 i8 i16 i32 i64 i128
syntax keyword gooseType c_char c_short c_ushort c_int c_uint c_long c_ulong c_longlong c_ulonglong c_longdouble


syntax keyword gooseDummy _
syntax keyword goosePreProc inline extern export simd recursive thread_fn pad reusable

syntax keyword gooseSpecial print str format assert abort hardware_threads thread_spawn thread_spawn_contained thread_wait gooseSpecial qput qget qpoll qlimit default copy to_bytes bytes_of from_bytes embed_shader embed_file index_of push append pop pop_n resize clear alloc_index alloc_ref free alloc_slice realloc_slice free_slice

" ===== MATCH
syntax match gooseType "\v<[iu][1-9]\d*>"
syntax match gooseOperator display "\V\[-+/*=^&?|!><%~]"
syntax match gooseArrowCharacter display "\V->"


syntax match gooseDecNumber display   "\v<\d%(_?\d)*%(\.\.@!)?%(\d%(_?\d)*)?%([eE][+-]?\d%(_?\d)*)?"
syntax match gooseHexNumber display "\v<0x\x%(_?\x)*%(\.\.@!)?%(\x%(_?\x)*)?%([pP][+-]?\d%(_?\d)*)?"
syntax match gooseOctNumber display "\v<0o\o%(_?\o)*"
syntax match gooseBinNumber display "\v<0b[01]%(_?[01])*"

syntax match gooseCharacterInvalid display contained /b\?'\zs[\n\r\t']\ze'/
syntax match gooseCharacterInvalidUnicode display contained /b'\zs[^[:cntrl:][:graph:][:alnum:][:space:]]\ze'/
syntax match gooseCharacter /b'\([^\\]\|\\\(.\|x\x\{2}\)\)'/ contains=gooseEscape,gooseEscapeError,gooseCharacterInvalid,gooseCharacterInvalidUnicode
syntax match gooseCharacter /'\([^\\]\|\\\([nrt\\'"]\|x\x\{2}\|u{\x\+}\)\)'/ contains=gooseEscape,gooseEscapeError,gooseCharacterInvalid

syntax region gooseBlock start="{" end="}" transparent fold

syntax region gooseCommentLine start="//" end="$" contains=gooseTodo
syntax region gooseCommentLineDoc start="//[/!]/\@!" end="$" contains=gooseTodo

syntax keyword gooseTodo contained TODO

syntax region gooseString matchgroup=gooseStringDelimiter start=+c\?"+ skip=+\\\\\|\\"+ end=+"+ oneline contains=gooseEscape,gooseEscapeError
syntax match gooseEscapeError   display contained /\\./
syntax match gooseEscape        display contained /\\\([nrt\\'"]\|x\x\{2}\|u{\x\+}\)/

syntax match gooseSliceOperator contained "[.:><]"
syntax match gooseSliceIndex display contained "\d"
syntax region gooseSlice start="\[" end="\]" contains=gooseSliceOperator,gooseSliceIndex


syntax keyword gooseFn fn nextgroup=gooseFnName skipwhite
syntax keyword gooseThreadFn thread_fn nextgroup=gooseFnName skipwhite
syntax match gooseFnName "[^ =:;<([]\+" contained nextgroup=gooseGeneric
syntax region gooseGeneric start="<" end=">" contained contains=gooseGenericVal,gooseType
syntax match gooseGenericVal "[A-Za-z]*" contained


syntax keyword gooseStruct struct nextgroup=gooseStructName skipwhite
syntax match gooseStructName "[^ =:;<([]\+" contained

syntax keyword gooseEnum enum nextgroup=gooseEnumName skipwhite
syntax match gooseEnumName "[^ =:;<([]\+" contained



highlight default link gooseGenericVal Special

" ===== DEFAULT

highlight default link gooseDecNumber gooseNumber
highlight default link gooseHexNumber gooseNumber
highlight default link gooseOctNumber gooseNumber
highlight default link gooseBinNumber gooseNumber

highlight default link gooseKeyword Keyword
highlight default link gooseType Type
highlight default link gooseCommentLine Comment
highlight default link gooseCommentLineDoc Comment
highlight default link gooseDummy Comment
highlight default link gooseTodo Todo
highlight default link gooseString String
highlight default link gooseStringDelimiter String
highlight default link gooseMultilineString String
highlight default link gooseMultilineStringContent String
highlight default link gooseMultilineStringPrefix String
highlight default link gooseMultilineStringDelimiter Delimiter
highlight default link gooseCharacterInvalid Error
highlight default link gooseCharacterInvalidUnicode gooseCharacterInvalid
highlight default link gooseCharacter Character
highlight default link gooseEscape Special
highlight default link gooseEscapeError Error
highlight default link gooseBoolean Boolean
highlight default link gooseNull Constant
highlight default link gooseNumber Number
highlight default link gooseArrowCharacter gooseOperator
highlight default link gooseOperator Operator
highlight default link gooseStatement Statement
highlight default link gooseDecl Statement
highlight default link gooseConditional Conditional
highlight default link gooseRepeat Repeat
highlight default link gooseSpecial Special
highlight default link gooseSliceOperator Repeat
highlight default link gooseSliceIndex Number
highlight default link goosePreProc PreProc

highlight default link gooseFnName Function
highlight default link gooseStructName Function
highlight default link gooseEnumName Function

highlight default link gooseFn Keyword
highlight default link gooseThreadFn Keyword
highlight default link gooseStruct Keyword
highlight default link gooseEnum Keyword


let b:current_syntax = "goose"

let &cpo = s:cpo_save
unlet! s:cpo_save
