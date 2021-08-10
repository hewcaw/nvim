" if dein#tap('vim-lua')
"   "\ "command": "lua-lsp",
"   
"   call coc#config('languageserver', {
"    \ 'lua': {
"      \ "command": "~/Documents/isiklik/playground/lua-language-server/bin/Linux/lua-language-server",
"      \ "args": ["-E", "-e", "LANG=en", "[~/Documents/isiklik/playground/lua-language-server/main.lua"],
"      \ "filetypes": ["lua"],
"      \ "rootPatterns": [".git/"]
"      \ }
"  \ })
" 
"   call coc#config('Lua.diagnostics.disable', [
"    \ "lowercase-global"
"    \ ])
" endif
