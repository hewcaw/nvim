"autocmd BufNewFile,BufRead *.jsx set ft=javascript.jsx
"autocmd BufNewFile,BufRead *.tsx set ft=typescript.tsx
autocmd FileType javascript.jsx call s:set_jsx_comment()
autocmd FileType typescript.tsx call s:set_jsx_comment()

function! s:set_jsx_comment() abort
    let &l:commentstring = ''
    unlet! b:caw_oneline_comment
    let b:caw_wrap_oneline_comment = ['{/*', '*/}']

    " Fix // comment colorscheme is cleared
    hi! link javascriptLineComment Comment

endfunction

autocmd FileType typescript.tsx :autocmd! CawTSX InsertLeave call s:set_jsx_comment()
