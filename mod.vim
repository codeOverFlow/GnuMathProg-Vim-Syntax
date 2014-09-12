" Vim syntax file
" Language:	GNU MathProg model file
" Maintainer:	Bodineau Adrien <adrien.bodineau@etu.univ-nantes.fr>

let s:cpo_save = &cpo
set cpo&vim

" case sensitive
syntax case match


" decision variables
syntax keyword modVAR var contained nextgroup=modVARNAME skipwhite
syntax match modVARNAME /var \([a-z]\|[A-Z]\|[0-9]\)\+/ contains=modVAR nextgroup=modOPERATORS skipwhite
syntax match modVARINOP /[^var]\&\([a-z]\|[A-Z]\|[0-9]\)\+/ skipwhite
" numbers
syntax match modNUMBERS /[0-9]\+\(\.[0-9]\+\)\?/ skipwhite
" objective function
syntax keyword modOBJ maximize minimize contained nextgroup=modNAME skipwhite
syntax match modNAME /\(maximize\|minimize\) \([a-z]\|[A-Z]\|[0-9]\)\+/ nextgroup=modCUT contains=modOBJ skipwhite
" constraints
setlocal iskeyword+=.
syntax keyword modCONSTRAINTS subject to s.t. contained skipwhite
syntax match modCONSTRAINTNAME /\(\(subject to\)\|s\.t\.\) \([a-z]\|[A-Z]\|[0-9]\)\+/ nextgroup=modCUT contains=modCONSTRAINTS skipwhite
" cut
syntax keyword modCUT : skipwhite
" function
syntax keyword modFUNCTIONS solve display printf sum end data model in  integer binary default for abs atan ceil floor exp log log10 max min round sin sqrt trunc Irand224 Uniform01 Uniform Normal01 Normal and by cross diff div else if in inter less mod not or symdiff then union within prod skipwhite
" comments
syntax match modCOMMENT /#.*/
syntax region modMULTCOMMENT start=/\/\*/ end=/\*\// skipnl
syntax region modSTRING start=/\"/ skip=/\\"/ end=/\"/ skipwhite
" sets & param
syntax keyword modUTILITY set param contained nextgroup=modUTILITYNAME skipwhite
syntax match modUTILITYNAME /\(set\|param\) \([a-z]\|[A-Z]\|[0-9]\)\+/ contains=modUTILITY skipwhite
" operators
syntax match modOPERATORS /=\|>=\|<=\|:=\|&\|>\|<\|<>\|==\|!=\|!\|&&\|||\|\.\./ skipwhite
"syntax region modBRACES start=/{/ end=/}/ contains=modUTILITYNAME skipwhite



" braces
"highlight modBRACES term=NONE ctermfg=Gray
" decision variables
highlight link modVAR Exception
highlight modVARNAME term=bold ctermfg=Blue
highlight link modVARINOP modVARNAME
" set & param
highlight link modUTILITY modVAR
highlight modUTILITYNAME term=NONE ctermfg=Brown
" numbers
highlight modNUMBERS term=NONE ctermfg=DarkRed
" operators
highlight modOPERATORS term=NONE ctermfg=DarkMagenta
" objective function
highlight link modOBJ modVAR
highlight link modNAME modOPERATORS
" constraints
highlight link modCONSTRAINTS modOBJ
highlight modCONSTRAINTNAME term=NONE ctermfg=DarkGreen
" functions
highlight link modFUNCTIONS modCONSTRAINTS
" comments & strings
highlight modCOMMENT term=bold ctermfg=Gray
highlight link modMULTCOMMENT modCOMMENT
highlight modSTRING term=NONE ctermfg=Red

let b:current_syntax="mod"
let &cpo = s:cpo_save
unlet s:cpo_save
" vim: ts=8
