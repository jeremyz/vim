" Vim syntax file
" Language:     Eo
" Maintainer:   Daniel Zaoui
" Last Change:  2014 06 01

" A bunch of useful keywords
syn keyword    eoBoolean false true
syn keyword    eoConstants null

syn keyword    eoType byte ubyte char short ushort int uint long ulong llong ullong int8 uint8 int16 uint16 int32 uint32 int64 uint64 int128 uint128 size ssize intptr uintptr ptrdiff time float double ldouble bool void

syn keyword    eoClassTypes class abstract interface mixin
syn keyword    eoStructure struct enum var
syn keyword    eoTypedef type
syn keyword    eoImport import

syn keyword    eoClassBodyLabels legacy_prefix eo_prefix data contained
syn keyword    eoClassBodyBlockOpener properties methods events constructors implements contained

syn keyword    eoInnerBlockOpener set get keys values params contained
syn keyword    eoTypeClass const own free contained
syn keyword    functionKeywords constructor destructor finalize virtual legacy
syn keyword    eoStatements return

" syn match      className               "\(\w\+\.\)\+\w\+"

syn match      attributes              "@\(inout\|out\|in\|property\|class\|free\|constructor\|extern\|beta\|protected\|const\|optional\|nullable\|warn_unused\|private\)"

syn match eoLabelMatch   "\w\+:" contains=eoClassBodyLabels
syn match eoBlockOpener  "\w\+\s*{" contains=eoClassBodyBlockOpener,eoInnerBlockOpener
syn match eoParenOpener  "\w\+\s*(" contains=eoTypeClass

syn keyword	eoTodo		contained TODO FIXME XXX
syn cluster	eoCommentGroup	contains=eoTodo

syn region	eoParen start='(' end=')' transparent
syn region	eoTypeParen start='<' end='>' transparent
syn region	eoBlock start="{" end="}" transparent fold

syn region     eo_comment start="\/\*" end="\*\/" contains=@eoCommentGroup

" Numbers
"integer number, or floating point number without a dot and with "f".
syn case ignore
syn match	eoNumbers	display transparent "\<\d\|\.\d" contains=eoNumber,eoFloat,eoOctalError,eoOctal
" Same, but without octal error (for comments)
syn match	eoNumbersCom	display contained transparent "\<\d\|\.\d" contains=eoNumber,eoFloat,eoOctal
syn match	eoNumber		display contained "\d\+\(u\=l\{0,2}\|ll\=u\)\>"
"hex number
syn match	eoNumber		display contained "0x\x\+\(u\=l\{0,2}\|ll\=u\)\>"
" Flag the first zero of an octal number as something special
syn match	eoOctal		display contained "0\o\+\(u\=l\{0,2}\|ll\=u\)\>" contains=eoOctalZero
syn match	eoOctalZero	display contained "\<0"
syn match	eoFloat		display contained "\d\+f"
"floating point number, with dot, optional exponent
syn match	eoFloat		display contained "\d\+\.\d*\(e[-+]\=\d\+\)\=[fl]\="
"floating point number, starting with a dot, optional exponent
syn match	eoFloat		display contained "\.\d\+\(e[-+]\=\d\+\)\=[fl]\=\>"
"floating point number, without dot, with exponent
syn match	eoFloat		display contained "\d\+e[-+]\=\d\+[fl]\=\>"

" flag an octal number with wrong digits
syn match	eoOctalError	display contained "0\o*[89]\d*"
syn case match

" Events region
syn region eoEventsRegion start="events\s*{" end="}" transparent
syn match eoEvents "^\s*[^;: ]\+\(;\|:\|\s\)" contained containedin=eoEventsRegion contains=eoEvent
syn match eoEvent "[^;: ]\+" contained

" Implements region
"syn region eoImplementsRegion start="\<implements\_s*{" end="}" transparent
"syn match eoImplements "\w\+" contained containedin=eoImplementsRegion

hi def link eoImplements Todo
hi def link eoEvent Identifier
hi def link eoClassBodyLabels Label
hi def link eoClassBodyBlockOpener Label
hi def link eoInnerBlockOpener Label
hi def link functionKeywords Label
hi def link eoTypeClass Label
hi def link attributes Constant
hi def link eo_comment Comment
hi def link eoBoolean Boolean
hi def link eoConstants Constant
hi def link className Identifier
hi def link eoStatements Statement

hi def link eoFloat Float
hi def link eoOctal Number
hi def link eoOctalZero Number
hi def link eoNumber Number
hi def link eoNumbersCom Number

hi def link eoOctalError Error

hi def link eoStructure Structure
hi def link eoClassTypes Structure

hi def link eoType Type
hi def link eoTypedef Typedef
hi def link eoTodo Todo

hi def link eoImport Include

let b:current_syntax = "eo"
