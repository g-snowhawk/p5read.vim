"=============================================================================
" FILE: p5read.vim
" AUTHOR:  Taka Goto <www.plus-5.com>
" License: MIT license
"=============================================================================

if exists('g:loaded_p5read')
  finish
endif

let s:save_cpo = &cpo
set cpo&vim

command! -nargs=1 -complete=customlist,p5read#complete P5read call p5read#load(<f-args>)

let g:loaded_p5read = 1

let &cpo = s:save_cpo
unlet s:save_cpo
