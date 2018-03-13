"=============================================================================
" FILE: p5read.vim
" AUTHOR:  Taka Goto <www.plus-5.com>
" License: MIT license
"=============================================================================

let s:save_cpo = &cpo
set cpo&vim

function! p5read#complete(lead, line, pos)
    let path = substitute(a:lead, "/[^/]*$", "", "")
    let search = substitute(a:lead, "^" . path . "/", "", "")
    let dirname = g:p5read#base_directory
    let prefix = ""
    if path != ""
        let templatesubdir = dirname . "/" . path
        if isdirectory(templatesubdir)
            let dirname = templatesubdir
            if search == path
                return []
            endif
            let prefix = path . "/"
        endif
    endif
    let matches = []
    let filelist = split(system("ls -1 " . dirname),"")
    for filename in filelist
        if filename =~? '^' . search
            let suffix = ""
            if isdirectory(dirname . "/" . filename)
                let suffix = "/"
            endif
            call add(matches, prefix . filename . suffix)
        endif
    endfor
    return matches
endfunction
function! p5read#load(path)
    let template = g:p5read#base_directory . "/" . a:path
    if !filereadable(template)
        echo template . " is not readable."
    else
        call execute("read " . template)
    endif
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
