" Movement:
" [INSERT] {{{ 
" inoremap <C-w> <C-[>diwa
" inoremap <C-h> <BS>
inoremap <C-d>       <Del>
" inoremap <C-k>       <ESC>d$a
" inoremap <C-u>       <C-G>u<C-U>
inoremap <C-b>       <Left>
inoremap <C-f>       <Right>
inoremap <M-f>       <C-Right>
inoremap <M-b>       <C-Left>
inoremap <C-a>       <Home>
inoremap <expr><C-e> pumvisible() ? "\<C-e>" : "\<End>"
" Insert newline above(below) and move to it:
inoremap <M-u>       <Esc><S-o>   
inoremap <M-i>       <Esc>o 
" }}}
" [NORMAL] {{{
nnoremap <M-u> o<Esc>
nnoremap <M-i> <S-o><Esc>
" }}}
" [CMDLINE] {{{
" @see https://stackoverflow.com/questions/12315612/move-forward-backwards-one-word-in-command-mode
" @see :h c_CTRL-B
cnoremap <C-a> <C-b>
cnoremap <M-b> <C-Left>
cnoremap <M-f> <C-Right>
" }}}

" File:
inoremap <C-s> <ESC>:w<CR>
nnoremap <C-s> :w<CR>
" inoremap <C-S-s> <ESC>:wq<CR>
inoremap <C-q> <ESC>:q!<CR>

" Buffer: 
" {{{
" nnoremap <silent> <Leader>.   :bn<CR>
" nnoremap <silent> <Leader>,   :bp<CR>
" nnoremap <silent> <Leader>xx  :bd<CR>
" nnoremap <silent> <Leader>xz  :bd #<CR>
" nnoremap <silent><Leader>xt <C-^><CR>
autocmd FileType typescriptreact 
    \ nnoremap <silent> <Leader>w   :w!<CR>
nnoremap <silent>   <Leader>q   :q<CR>
" }}}

" Clipboard: {{{
" ==========
" learn more: ../Docs/clipboard.md
" https://www.reddit.com/r/neovim/comments/3fricd/easiest_way_to_copy_from_neovim_to_system/
" https://stackoverflow.com/questions/11917814/difference-between-and-g-in-vim
vnoremap <leader>xy     "+y
vnoremap <leader>xc     "+ygvd
nnoremap <leader>xyy    "+yy
nnoremap <Leader>xY     _"+yg_
 
nnoremap <leader>xp      "+p
nnoremap <leader>xP      "+P
vnoremap <leader>xp      "+p
vnoremap <leader>xP      "+P
" Yank to end (exclude newline)
" nnoremap Y y$
" ========== }}}

nnoremap zl zczA

" Get highlight group at cursor.
map <Leader>uo      :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") 
    \ . '> trans<'
    \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
    \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

map <leader>uc :<C-u>cd %:p:h


nnoremap <Leader>ul :<C-u>luafile %<CR>
nnoremap <Leader>un :<C-u>source %<CR>
nnoremap gx :execute 'silent! !xdg-open "<cfile>" &> /dev/null &' <bar> redraw! <CR>
