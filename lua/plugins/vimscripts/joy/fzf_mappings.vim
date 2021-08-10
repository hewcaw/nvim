if dein#tap('fzf.vim')
  " nnoremap <silent> <leader>fc :Colors<CR>
  nnoremap <silent> <leader>fc :Commands<CR>
  nnoremap <silent> <leader>fb :Buffers<CR>
  nnoremap <silent> <leader>ff :call Fzf_dev()<CR>
  nnoremap <silent> <leader>fr :Rg<CR>
  nnoremap <silent> <leader>fw :Rg <C-R><C-W><CR>
endif

