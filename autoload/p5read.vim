"=============================================================================
" FILE: p5read.vim
" AUTHOR:  Taka Goto <www.plus-5.com>
" License: MIT license
"=============================================================================

if !exists('g:loaded_p5read')
    finish
endif

let s:save_cpo = &cpo
set cpo&vim

function! p5read#load(path) abort
    let template = g:p5read#base_directory . "/" . a:path
    if !filereadable(template)
        echo template . " is not readable."
    else
        execute("read " . template)
    endif
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
