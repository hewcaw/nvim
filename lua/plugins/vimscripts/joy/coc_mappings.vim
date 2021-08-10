if dein#tap('coc.nvim')
  " Flutter
  nnoremap <silent> <leader>cu  :<C-u>CocList --input=flutter commands<cr>

  " Using CocList
  " Show all diagnostics
  nnoremap <silent> <leader>cdi  :<C-u>CocList diagnostics<cr>
  " Manage extensions
  nnoremap <silent> <leader>ce  :<C-u>CocList extensions<cr>
  " Show commands
  nnoremap <silent> <leader>cc  :<C-u>CocList commands<cr>
  " Find symbol of current document
  nnoremap <silent> <leader>co  :<C-u>CocList outline<cr>
  " Search workspace symbols
  nnoremap <silent> <leader>cs  :<C-u>CocList -I symbols<cr>
  " Resume latest coc list
  "nnoremap <silent> <leader>cr  :<C-u>CocListResume<CR>

  nnoremap <silent> <leader>cr  :<C-u>CocRestart<cr>


  " Do default action for next item.
  nnoremap <silent> <leader>cj  :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <silent> <leader>ck  :<C-u>CocPrev<CR>

  " Use `[c` and `]c` for navigate diagnostics
  nmap <silent> cdp <Plug>(coc-diagnostic-prev)
  nmap <silent> cdn <Plug>(coc-diagnostic-next)

  " Remap for rename current word
  nmap <leader>cn <Plug>(coc-rename)
  " Remap for format selected region
  vmap <leader>cf  <Plug>(coc-format-selected)
  nmap <leader>cf  <Plug>(coc-format-selected)
  " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
  xmap <leader>ca  <Plug>(coc-codeaction-selected)
  nmap <leader>ca  <Plug>(coc-codeaction-selected)
  " Remap for do codeAction of current line
  nmap <leader>ac  <Plug>(coc-codeaction)

  " Remove Waitlen:
  " Fix autofix problem of current line
  "nmap <leader>qf  <Plug>(coc-fix-current)

  " Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)
  " Use K for show documentation in float window
  nnoremap <silent> K :call CocActionAsync('doHover')<CR>
  " use <c-space> for trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()
  nmap [g <Plug>(coc-git-prevchunk)
  nmap ]g <Plug>(coc-git-nextchunk)
  " show chunk diff at current position
  nmap gs <Plug>(coc-git-chunkinfo)
  " show commit contains current position
  nmap gm <Plug>(coc-git-commit)
  nnoremap <silent> <leader>cg  :<C-u>CocList --normal gstatus<CR>
  " float window scroll
  nnoremap <expr><C-f> coc#util#has_float() ? coc#util#float_scroll(1) : "\<C-f>"
  nnoremap <expr><C-b> coc#util#has_float() ? coc#util#float_scroll(0) : "\<C-b>"

  " multiple cursors
  " nmap <silent> <C-c> <Plug>(coc-cursors-position)
  " nmap <expr> <silent> <C-m> <SID>select_current_word()
  " xmap <silent> <C-d> <Plug>(coc-cursors-range)

  " use normal command like `<leader>xi(`
  " nmap <leader>x  <Plug>(coc-cursors-operator)

  function! s:select_current_word()
      if !get(g:, 'coc_cursors_activated', 0)
          return "\<Plug>(coc-cursors-word)"
      endif
      return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
  endfunc

  nnoremap <silent> <leader>cm ::CocSearch -w 
  nnoremap <silent> <leader>cw ::CocSearch  
  " use normal command like `<leader>xi(`
  " nmap <leader>x  <Plug>(coc-cursors-operator)

  " coc-explorer
  noremap <silent> <leader>e :<C-u>CocCommand explorer<CR>
  " noremap <silent> <leader>ce :execute 'CocCommand explorer' .
  "    \ ' --toggle' .
  "    \ ' --sources=buffer+,file+' .
  "    \ ' --file-columns=git,selection,icon,clip,indent,filename,size ' . expand('%:p:h')<CR>
endif

