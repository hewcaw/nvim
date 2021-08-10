augroup ayu_colorscheme
  autocmd!
  autocmd ColorScheme *
      \ hi! Comment ctermfg=14 guifg=#5C6773 cterm=italic gui=italic
  
  " Ayu itself {{{
  " ========== 
   autocmd ColorScheme *
      \ hi! Underlined gui=underline,italic guifg=#B8CC52 |
      \ hi! link Directory Identifier |
      \ hi! VertSplit guifg=#101920
  
  " }}}

  " Neovim
  " autocmd ColorScheme * hi! Cursor gui=inverse
  autocmd ColorScheme * hi! LineNr guifg=#555555
  " https://stackoverflow.com/questions/3813059/is-it-possible-to-not-display-a-for-blank-lines-in-vim
  autocmd ColorScheme *
      \ hi! NonText       guifg=bg |
      \ hi! Search        guibg=#FFB454 guifg=#3E4B59
      "\ hi! IncSearch     guifg=#3E4B59 guibg=#FF7733 gui=NONE |
      "\ hi! Cursor        guifg=reverse guibg=#FF7733 gui=NONE |
      "\ hi! VisualNC      guifg=#3E4B59 guibg=#FF7733 gui=NONE |

  " SignColumn
  autocmd ColorScheme * hi! link SignColumn Normal

  " Folding
  " autocmd ColorScheme * hi! Folded guifg=#F29718 guibg=NONE
  " autocmd ColorScheme * hi! link Folded Type
  autocmd ColorScheme * hi! Folded guifg=#36A3D9 " gui=bold
  autocmd ColorScheme * hi! link FoldColumn CursorLineNr

  " Diff
  autocmd ColorScheme * hi! link diffRemoved WarningMsg
  autocmd ColorScheme * hi! link DiffDelete  WarningMsg

  " Ts, Tsx {{{
  " ======= 
  autocmd ColorScheme * hi! link tsxTag      MoreMsg
  autocmd ColorScheme * hi! link tsxTagName  Type
  autocmd ColorScheme * 
      \ hi! link tsxCloseTag           Type |

  " }}}
  " Dart {{{
  " ==== 
  autocmd ColorScheme * 
      \ hi! link dartClassDecl dartKeyword |
      \ hi! link dartTypedef dartKeyword |
      \ hi! link dartStorageClass ModeMsg

  " }}}
  
  " Defx (deprecated) {{{
  " ================= 
  
  " }}}
  " Markdown {{{
  " ======== 
  "    \ hi! link markdownError        Visual |
  "    \ hi! link markdownBlockQuote   Function |
  "    \ hi! link markdownLinkText     Directory |
  autocmd ColorScheme * 
      "\ hi! markdownItalic   guibg=NONE gui=italic |
      "\ hi! markdownUrl guifg=#B8CC52 gui=italic |
      \ hi! Title gui=bold |
      \ hi! markdownLinkText gui=underline guifg=#36A3D9 |
      \ hi! link markdownUrl Underlined |
      \ hi! link markdownCode markdownCodeDelimiter

  " }}}
  " Coc {{{
  " hi! CocHintSign
  autocmd ColorScheme *
      \ hi! CocWarningSign guifg=#cca000 gui=bold |
      \ hi! CocErrorSign guifg=#d21f3c gui=bold

  " }}}
  
  " autocmd ColorScheme * hi! Function guifg=#FFB454 gui=underline

  " Snippet
  autocmd ColorScheme *
      \ hi! link snipLeadingSpaces Visual     
augroup END
