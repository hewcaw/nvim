let g:which_key_map =  {}
let g:which_key_sep = '➜'

" Buffer:
let g:which_key_map.b = {'name' : '+Buffet'}
let g:which_key_map.b.l = 'Delete last buffer'
let g:which_key_map.b.n = 'Goto next buffer'
let g:which_key_map.b.p = 'Goto previous buffer'
let g:which_key_map.b.v = 'Goto previously-visited buffer'
let g:which_key_map.1 = 'which_key_ignore'
let g:which_key_map.2 = 'which_key_ignore'
let g:which_key_map.3 = 'which_key_ignore'
let g:which_key_map.4 = 'which_key_ignore'
let g:which_key_map.5 = 'which_key_ignore'
let g:which_key_map.6 = 'which_key_ignore'
let g:which_key_map.7 = 'which_key_ignore'
let g:which_key_map.8 = 'which_key_ignore'
let g:which_key_map.9 = 'which_key_ignore'

" Clipboard:
let g:which_key_map.x = {'name' : '+Clipboard'}

" Fuzzy:
let g:which_key_map.f = {'name' : '+Fuzzy'}

" Git:
let g:which_key_map.g = {'name' : '+Gina'}


" let g:which_key_map.a = {
"      \ 'name' : '+actions' ,
"      \ 'c' : [':ColorizerToggle'        , 'colorizer'],
"      \ 'e' : [':CocCommand explorer'    , 'explorer'],
"      \ 'h' : [':let @/ = ""'            , 'remove search highlight'],
"      \ 'l' : [':Bracey'                 , 'start live server'],
"      \ 'L' : [':BraceyStop'             , 'stop live server'],
"      \ 'm' : [':MarkdownPreview'        , 'markdown preview'],
"      \ 'M' : [':MarkdownPreviewStop'    , 'markdown preview stop'],
"      \ 'n' : [':set nonumber!'          , 'line-numbers'],
"      \ 's' : [':s/\%V\(.*\)\%V/"\1"/'   , 'surround'],
"      \ 'r' : [':set norelativenumber!'  , 'relative line nums'],
"      \ 't' : [':FloatermToggle'         , 'terminal'],
"      \ 'v' : [':Codi'                   , 'virtual repl on'],
"      \ 'V' : [':Codi!'                  , 'virtual repl off'],
"      \ 'w' : [':StripWhitespace'        , 'strip whitespace'],
"      \ }

call which_key#register('<Space>', "g:which_key_map")
