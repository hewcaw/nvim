" UTF-8 {{{
" =====
" Checkout: https://stackoverflow.com/questions/16507777
" TODO: Learn why :)
if has('vim_starting')
  set encoding=UTF-8
  scriptencoding UTF-8
endif
" }}}

augroup MyAutoCmd
  autocmd!
  autocmd CursorHold *? syntax sync minlines=300
augroup END

" Number {{{
" ======
" Hybrid Number & RelativeNumber - https://jeffkreeftmeijer.com/vim-number/
set number relativenumber
" augroup HybridNumber
"   au!
"   autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu | endif
"   autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
" augroup END
" }}}

" Clipboard {{{
" if has('clipboard')
"   set clipboard& clipboard+=unnamedplus
" endif
" }}}


" Autowrite
" Checkout: http://albertomiorin.com/blog/2012/12/10/autoread-and-autowrite-in-vim/
augroup autosave
    au!
    au FocusLost * wall
augroup END
"set nohidden        " Before this, I used hidden at lower
set hidden
set nobackup
set noswapfile
set nowritebackup
set autoread
set autowrite
set autowriteall    " XXX: He doesn't use this
set confirm " XXX:


"Browsing file based on buffer
set bsdir=buffer


" Undo
set undofile
set undodir=~/.tmp/undo


" Gruvbox_transp_bg
" XXX: ???


" Timing ?
set timeout ttimeout " Before, I don't set this but as :h say it still works :)
set timeoutlen=500 ttimeoutlen=10
" Checkout:
" https://www.reddit.com/r/vim/comments/3ql651/what_do_you_set_your_updatetime_to/
set updatetime=100   " I used 750 before


" Backspace XXX: ???
"set backspace=2
"set backspace=indent,eol,start


" Indentation:
" TODO: Learn more about this at `general.vim` and :h {{{
" set textwidth=80
set tabstop=4
set cindent shiftwidth=4
set autoindent shiftwidth=4
set expandtab
set softtabstop=4     " I didn't use these 4, learn at `general.vim` when free
set smarttab
set smartindent
set shiftround
" ============ }}}


" Completion: {{{
set completefunc=emoji#complete
set completeopt =longest,menu
set completeopt-=preview
" =========== }}}

" Case, Searching, . . . {{{
set ignorecase      " Search ignoring case
set smartcase       " Keep case when searching with *
set infercase       " Adjust case in insert completion mode
set incsearch       " Incremental search
set hlsearch        " Highlight search results
set wrapscan        " Searches wrap around the end of the file
"set showmatch       " Jump to matching bracket, i dont like it to jump when search
set matchpairs+=<:> " Add HTML brackets to pair matching
set matchtime=1     " Tenths of a second to show the matching paren
" XXX: Why we need this ? when it in default
set cpoptions-=m    " showmatch will wait 0.5s or until a char is typed
set grepprg=rg\ --vimgrep\ $*
set wildignore+=*.so,*~,*/.git/*,*/.svn/*,*/.DS_Store,*/tmp/*
" OLD ONE -------------
"set ignorecase      " Search ignoring case
"set smartcase       " Keep case when searching with *
"set infercase       " Adjust case in Insert Completion mode
"set incsearch       " Incremental search
"set hlsearch        " Highlight search results
"set wrapscan        " Searches wrap around the end of the file
"set showmatch       " Jump to matching bracket
"set matchpairs+=<:> " Add HTML brackets to pair matching
"set matchtime=1     " Tenths of a second to show the matching paren
" ====================== }}}


" XXX: Vim directories

set t_ZH=[3m
set t_ZR=[23m


" History saving (no VIM fallback)
set history=1000
if has('nvim')
	set shada='300,<50,@100,s10,h
endif

" Folding:
" set foldmethod=syntax
set foldmethod=marker
set foldlevel=5
set foldenable
" set foldlevelstart=99
set foldlevelstart=0
" set foldcolumn=1
" set foldlevelstart=99
" if has('folding')
"   set foldenable
" endif

" augroup remember_folds
"   autocmd!
"   autocmd BufWinLeave * mkview
"   autocmd BufWinEnter * silent! loadview
" augroup END











" Neo/vim Settings
" ===

" " General {{{
" set mouse=nv                 " Disable mouse in command-line mode
" set modeline                 " automatically setting options from modelines
" set report=0                 " Don't report on line changes
" set errorbells               " Trigger bell on error
" set visualbell               " Use visual bell instead of beeping
" set hidden                   " hide buffers when abandoned instead of unload
" set fileformats=unix,dos,mac " Use Unix as the standard file type
" set magic                    " For regular expressions turn magic on
" set path+=**                 " Directories to search when using gf and friends
" set isfname-==               " Remove =, detects filename in var=/foo/bar
" set virtualedit=block        " Position cursor anywhere in visual block
" set synmaxcol=2500           " Don't syntax highlight long lines
" set formatoptions+=1         " Don't break lines after a one-letter word
" set formatoptions-=t         " Don't auto-wrap text
" set formatoptions-=o         " Disable comment-continuation (normal 'o'/'O')
" if has('patch-7.3.541')
" 	set formatoptions+=j       " Remove comment leader when joining lines
" endif
" 
" if has('vim_starting')
" 	set encoding=utf-8
" 	scriptencoding utf-8
" endif
" 
" " What to save for views and sessions:
" set viewoptions=folds,cursor,curdir,slash,unix
" set sessionoptions=curdir,help,tabpages,winsize
" 
" if has('mac') && has('vim_starting')
" 	let g:clipboard = {
"		\   'name': 'macOS-clipboard',
"		\   'copy': {
"		\      '+': 'pbcopy',
"		\      '*': 'pbcopy',
"		\    },
"		\   'paste': {
"		\      '+': 'pbpaste',
"		\      '*': 'pbpaste',
"		\   },
"		\   'cache_enabled': 0,
"		\ }
" endif
" 
" if has('clipboard') && has('vim_starting')
" 	set clipboard& clipboard+=unnamedplus
" endif
" 
" " }}}
" " Wildmenu {{{
" " --------
" if has('wildmenu')
" 	if ! has('nvim')
" 		set nowildmenu
" 		set wildmode=list:longest,full
" 	endif
" 	set wildignorecase
" 	set wildignore+=.git,.hg,.svn,.stversions,*.pyc,*.spl,*.o,*.out,*~,%*
" 	set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store
" 	set wildignore+=**/node_modules/**,**/bower_modules/**,*/.sass-cache/*
" 	set wildignore+=__pycache__,*.egg-info,.pytest_cache,.mypy_cache/**
" 	" set wildcharm=<C-z>  " substitue for 'wildchar' (<Tab>) in macros
" endif
" 
" " }}}
" " Vim Directories {{{
" " ---------------
" set undofile swapfile nobackup
" set directory=$DATA_PATH/swap//,$DATA_PATH,~/tmp,/var/tmp,/tmp
" set undodir=$DATA_PATH/undo//,$DATA_PATH,~/tmp,/var/tmp,/tmp
" set backupdir=$DATA_PATH/backup/,$DATA_PATH,~/tmp,/var/tmp,/tmp
" set viewdir=$DATA_PATH/view/
" set spellfile=$VIM_PATH/spell/en.utf-8.add
" 
" " History saving
" set history=2000
" 
" if has('nvim') && ! has('win32') && ! has('win64')
" 	set shada=!,'300,<50,@100,s10,h
" else
" 	set viminfo='300,<10,@50,h,n$DATA_PATH/viminfo
" endif
" 
" augroup user_persistent_undo
" 	autocmd!
" 	au BufWritePre /tmp/*          setlocal noundofile
" 	au BufWritePre COMMIT_EDITMSG  setlocal noundofile
" 	au BufWritePre MERGE_MSG       setlocal noundofile
" 	au BufWritePre *.tmp           setlocal noundofile
" 	au BufWritePre *.bak           setlocal noundofile
" augroup END
" 
" " If sudo, disable vim swap/backup/undo/shada/viminfo writing
" if $SUDO_USER !=# '' && $USER !=# $SUDO_USER
"		\ && $HOME !=# expand('~'.$USER, 1)
"		\ && $HOME ==# expand('~'.$SUDO_USER, 1)
" 
" 	set noswapfile
" 	set nobackup
" 	set nowritebackup
" 	set noundofile
" 	if has('nvim')
" 		set shada="NONE"
" 	else
" 		set viminfo="NONE"
" 	endif
" endif
" 
" " Secure sensitive information, disable backup files in temp directories
" if exists('&backupskip')
" 	set backupskip+=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*
" 	set backupskip+=.vault.vim
" endif
" 
" " Disable swap/undo/viminfo files in temp directories or shm
" augroup user_secure
" 	autocmd!
" 	silent! autocmd BufNewFile,BufReadPre
"		\ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim
"		\ setlocal noswapfile noundofile
"		\ | set nobackup nowritebackup
"		\ | if has('nvim') | set shada= | else | set viminfo= | endif
" augroup END
" 
" " }}}
" " Tabs and Indents {{{
" " ----------------
" set textwidth=80    " Text width maximum chars before wrapping
" set noexpandtab     " Don't expand tabs to spaces
" set tabstop=2       " The number of spaces a tab is
" set shiftwidth=2    " Number of spaces to use in auto(indent)
" set softtabstop=-1  " Automatically keeps in sync with shiftwidth
" set smarttab        " Tab insert blanks according to 'shiftwidth'
" set autoindent      " Use same indenting on new lines
" " set smartindent     " Smart autoindenting on new lines
" set shiftround      " Round indent to multiple of 'shiftwidth'
" 
" if exists('&breakindent')
" 	set breakindentopt=shift:2,min:20
" endif
" 
" " }}}
" " Timing {{{
" " ------
" set timeout ttimeout
" set timeoutlen=500   " Time out on mappings
" set ttimeoutlen=10   " Time out on key codes
" set updatetime=200   " Idle time to write swap and trigger CursorHold
" set redrawtime=2000  " Time in milliseconds for stopping display redraw
" 
" " }}}
" " Searching {{{
" " ---------
" set ignorecase    " Search ignoring case
" set smartcase     " Keep case when searching with *
" set infercase     " Adjust case in insert completion mode
" set incsearch     " Incremental search
" set wrapscan      " Searches wrap around the end of the file
" 
" set complete=.,w,b,k  " C-n completion: Scan buffers, windows and dictionary
" 
" if exists('+inccommand')
" 	set inccommand=nosplit
" endif
" 
" if executable('rg')
" 	set grepformat=%f:%l:%c:%m
" 	let &grepprg =
"		\ 'rg --hidden --vimgrep' . (&smartcase ? ' --smart-case' : '') . ' --'
" elseif executable('ag')
" 	set grepformat=%f:%l:%c:%m
" 	let &grepprg =
"		\ 'ag --hidden --vimgrep' . (&smartcase ? ' --smart-case' : '') . ' --'
" endif
" 
" " }}}
" " Behavior {{{
" " --------
" set nowrap                      " No wrap by default
" set linebreak                   " Break long lines at 'breakat'
" set breakat=\ \	;:,!?           " Long lines break chars
" set nostartofline               " Cursor in same column for few commands
" set whichwrap+=h,l,<,>,[,],~    " Move to following line on certain keys
" set splitbelow splitright       " Splits open bottom right
" set switchbuf=useopen           " Look for matching window buffers first
" set backspace=indent,eol,start  " Intuitive backspacing in insert mode
" set diffopt=filler,iwhite       " Diff mode: show fillers, ignore whitespace
" set completeopt=menu,menuone    " Always show menu, even for one item
" 
" if has('patch-7.4.775')
" 	set completeopt+=noselect       " Do not select a match in the menu
" endif
" 
" if exists('+completepopup')
" 	set completeopt+=popup
" 	set completepopup=height:4,width:60,highlight:InfoPopup
" endif
" 
" if has('patch-7.4.775')
" 	" Do not insert any text for a match until the user selects from menu
" 	set completeopt+=noinsert
" endif
" 
" if has('patch-8.1.0360') || has('nvim-0.5')
" 	set diffopt+=internal,algorithm:patience
" 	" set diffopt=indent-heuristic,algorithm:patience
" endif
" 
" " Use the new Neovim :h jumplist-stack
" if has('nvim-0.5')
" 	set jumpoptions=stack
" endif
" 
" " }}}
" " Editor UI {{{
" " --------------------
" set noshowmode          " Don't show mode in cmd window
" set shortmess=aoOTI     " Shorten messages and don't show intro
" set scrolloff=2         " Keep at least 2 lines above/below
" set sidescrolloff=5     " Keep at least 5 lines left/right
" set nonumber            " Don't show line numbers
" set noruler             " Disable default status ruler
" set list                " Show hidden characters
" 
" set showtabline=2       " Always show the tabs line
" set winwidth=30         " Minimum width for active window
" set winminwidth=10      " Minimum width for inactive windows
" " set winheight=4         " Minimum height for active window
" " set winminheight=4      " Minimum height for inactive window
" set pumheight=15        " Pop-up menu's line height
" set helpheight=12       " Minimum help window height
" set previewheight=12    " Completion preview height
" 
" set showcmd             " Show command in status line
" set cmdheight=2         " Height of the command line
" set cmdwinheight=5      " Command-line lines
" set noequalalways       " Don't resize windows on split or close
" set laststatus=2        " Always show a status line
" set colorcolumn=+0      " Column highlight at textwidth's max character-limit
" set display=lastline
" 
" if has('folding') && has('vim_starting')
" 	set foldenable
" 	set foldmethod=indent
" 	set foldlevelstart=99
" endif
" 
" if has('nvim-0.4')
" 	set signcolumn=auto:1
" elseif exists('&signcolumn')
" 	set signcolumn=auto
" endif
" 
" " UI Symbols
" " icons:  ▏│ ¦ ╎ ┆ ⋮ ⦙ ┊ 
" let &showbreak='↳  '
" set listchars=tab:\▏\ ,extends:⟫,precedes:⟪,nbsp:␣,trail:·
" " set fillchars=foldopen:O,foldclose:x
" " set fillchars=vert:▉,fold:─
" 
" if has('patch-7.4.314')
" 	" Do not display completion messages
" 	set shortmess+=c
" endif
" 
" if has('patch-7.4.1570')
" 	" Do not display message when editing files
" 	set shortmess+=F
" endif
" 
" if has('conceal') && v:version >= 703
" 	" For snippet_complete marker
" 	set conceallevel=2 concealcursor=niv
" endif
" 
" if exists('+previewpopup')
" 	set previewpopup=height:10,width:60
" endif
" 
" " Pseudo-transparency for completion menu and floating windows
" if has('termguicolors') && &termguicolors
" 	if exists('&pumblend')
" 		set pumblend=10
" 	endif
" 	if exists('&winblend')
" 		set winblend=10
" 	endif
" endif
" 
" " }}}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
