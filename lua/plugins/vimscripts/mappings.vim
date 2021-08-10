" Global Key Mappings: 
" =================== {{{
if dein#tap('dein.vim')
nnoremap <Leader>ud :<C-u>call dein#recache_runtimepath()<CR>
endif
" ==================== }}}
if dein#tap('fzf.vim')
  nnoremap <silent> <leader>fc :Colors<CR>
  nnoremap <silent> <leader>fb :Buffers<CR>
  nnoremap <silent> <leader>ff :call Fzf_dev()<CR>
  nnoremap <silent> <leader>fr :Rg<CR>
  nnoremap <silent> <leader>fw :Rg <C-R><C-W><CR>
endif


" ==== }}}

" Buffet: {{{
" if dein#tap('vim-buffet')
"     nmap <leader>1 <Plug>BuffetSwitch(1)
"     nmap <leader>2 <Plug>BuffetSwitch(2)
"     nmap <leader>3 <Plug>BuffetSwitch(3)
"     nmap <leader>4 <Plug>BuffetSwitch(4)
"     nmap <leader>5 <Plug>BuffetSwitch(5)
"     nmap <leader>6 <Plug>BuffetSwitch(6)
"     nmap <leader>7 <Plug>BuffetSwitch(7)
"     nmap <leader>8 <Plug>BuffetSwitch(8)
"     nmap <leader>9 <Plug>BuffetSwitch(9)
"     nmap <leader>0 <Plug>BuffetSwitch(10)
" endif
" ======= }}}



if dein#tap('defx.nvim')
    nnoremap <silent> <Leader>e
        \ :<C-u>Defx -resume -toggle -buffer-name=tab`tabpagenr()`<CR>
    nnoremap <silent> <Leader>F
        \ :<C-u>Defx -resume -toggle -search=`expand('%:p')` `getcwd()`<CR>
endif

if dein#tap('vista.vim')
    nnoremap <silent><Leader>uv :Vista!!<CR>
    nnoremap <silent><leader>fv :Vista finder coc<CR>
endif

" Git:
" ==== {{{
if dein#tap('vim-easygit')
	" nnoremap <silent> <Leader>gd :Gdiff<CR>
	" nnoremap <silent> <Leader>gc :Gcommit<CR>
	" nnoremap <silent> <Leader>gb :Gblame<CR>
	" nnoremap <silent> <Leader>gB :Gbrowse<CR>
	" nnoremap <silent> <Leader>gS :Gstatus<CR>
	" nnoremap <silent> <localleader>gp :Gpush<CR>
endif

if dein#tap('magit.vim')
	"nnoremap <silent><Leader>gm :Magit<CR>
endif

" ==== }}}



if dein#tap('vim-easymotion')
    nmap <Leader><Leader>w <Plug>(easymotion-w)
    nmap <Leader><Leader>f <Plug>(easymotion-f)
    nmap <Leader><Leader>b <Plug>(easymotion-b)
endif

if dein#tap('caw.vim')
    function! InitCaw() abort
		if ! &l:modifiable
			silent! nunmap <buffer> gc
			silent! xunmap <buffer> gc
			silent! nunmap <buffer> gcc
			silent! xunmap <buffer> gcc
		else
			nmap <buffer> gc <Plug>(caw:prefix)
			xmap <buffer> gc <Plug>(caw:prefix)
			nmap <buffer> gcc <Plug>(caw:hatpos:toggle)
			xmap <buffer> gcc <Plug>(caw:hatpos:toggle)
		endif
	endfunction
	autocmd FileType * call InitCaw()
	call InitCaw()
endif

if dein#tap('vim-commentary')
    function! InitCommentary() abort
   "      if ! &l:modifiable
			" silent! nunmap <buffer> gc
			" silent! xunmap <buffer> gc
			" silent! nunmap <buffer> gcc
			" silent! xunmap <buffer> gcc
   "      else
            " xmap <buffer> gc <Plug>Commentary
            " nmap <buffer> gc  <Plug>Commentary
            " omap <buffer> gc  <Plug>Commentary
            " nmap <buffer> gcc <Plug>CommentaryLine
        " endif
    endfunction
endif

if dein#tap('tabular')
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:\zs<CR>
    vmap <Leader>a: :Tabularize /:\zs<CR>
endif

if dein#tap('vim-sandwich')
     nmap <silent> sa <Plug>(operator-sandwich-add)
     xmap <silent> sa <Plug>(operator-sandwich-add)
     omap <silent> sa <Plug>(operator-sandwich-g@)
     nmap <silent> sd <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
     xmap <silent> sd <Plug>(operator-sandwich-delete)
     nmap <silent> sr <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
     xmap <silent> sr <Plug>(operator-sandwich-replace)
     nmap <silent> sdb <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
     nmap <silent> srb <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
     omap ib <Plug>(textobj-sandwich-auto-i)
     xmap ib <Plug>(textobj-sandwich-auto-i)
     omap ab <Plug>(textobj-sandwich-auto-a)
     xmap ab <Plug>(textobj-sandwich-auto-a)
     omap is <Plug>(textobj-sandwich-query-i)
     xmap is <Plug>(textobj-sandwich-query-i)
     omap as <Plug>(textobj-sandwich-query-a)
     xmap as <Plug>(textobj-sandwich-query-a)
endif

if dein#tap('markdown-preview.nvim')
    nmap <silent> <localLeader>md <Plug>MarkdownPreview
endif

