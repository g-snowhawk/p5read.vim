"=============================================================================
" FILE: complete.vim
" AUTHOR:  Taka Goto <www.plus-5.com>
" License: MIT license
"=============================================================================

if !exists('g:loaded_p5read')
    finish
endif

let s:save_cpo = &cpo
set cpo&vim

function! p5read#complete#list(lead, line, pos) abort
    return s:get_list(a:lead)
endfunction

function! s:get_list(keyword) abort
    let matches = []
    let path = substitute(a:keyword, "/[^/]*$", "", "")
    let search = substitute(a:keyword, "^" . path . "/\\=", "", "")
    let dirname = g:p5read#base_directory
    let prefix = ""
    if path != ""
        let templatesubdir = dirname . "/" . path
        if isdirectory(templatesubdir)
            if search == path
                return matches
            endif
            let dirname = templatesubdir
            let prefix = path . "/"
        endif
    endif
    let filelist = split(system("ls -1 " . dirname), "")
    for filename in filelist
        let hint = search == ""
            \ && a:keyword !~ '/$'
            \ && (path != a:keyword || prefix == '')
            \ ? a:keyword : search
        if filename =~? '^' . hint
            let suffix = isdirectory(dirname . "/" . filename) ? "/" : ""
            call add(matches, prefix . filename . suffix)
        endif
    endfor
    return matches
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
