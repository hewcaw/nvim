let g:indentLine_enabled = 1
let g:indentLine_char='│'
let g:indentLine_color_gui= '#333333'
let g:indentLine_fileTypeExclude = ['defx', 'denite', 'startify', 'tagbar', 'vista_kind', 'vista']
" let g:indentLine_concealcursor = 'niv'
"let g:indentLine_color_term = 96
"let g:indentLine_showFirstIndentLevel =1


augroup NoConcealJson
    autocmd! 
    autocm Filetype json setlocal conceallevel=0
    autocmd Filetype json setlocal g:indentLine_setConceal = 0
augroup END
