" Cursor Shape:
" See https://vim.fandom.com/wiki/Configuring_the_cursor
if has('vim_starting')
  "highlight Cursor guifg=white guibg=black
  "highlight iCursor guifg=white guibg=blue
  set guicursor=n-v-c:block-Cursor
  set guicursor+=i:hor25-iCursor
  set guicursor+=n-v-c:blinkon0
endif

if has('conceal')
" 	set conceallevel=3 concealcursor=niv
    set conceallevel=0
endif

" XXX: Maybe I don't need this and maybe it belongs to the UI
"set list
"set listchars=tab:»·,nbsp:+,trail:·,extends:→,precedes:←

" If I unif this, editing buffet.vim and save not auto reload Highlight
if has('vim_starting')
  set t_Co=256
  set signcolumn=yes
  set shortmess=aFc
  set cmdheight=2
  set splitbelow
  set fillchars+=vert:\┃  " add a bar for vertical splits
  set termguicolors
  " colo ayu
  " g:colors_name

  " Statusline
  " source $VIM_PATH/core/ui/statusline.vim


  " See https://stackoverflow.com/questions/2440149/override-colorscheme
  " ====================== {{{
  "if g:colors_name == "ayu"
  "    source $VIM_PATH/core/ui/colos/ayu.vim
  "endif
  " ====================== }}}
endif
