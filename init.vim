if &compatible
  " vint: -ProhibitSetNoCompatible
  set nocompatible
  " vint: +ProhibitSetNoCompatible
endif

let $VIM_PATH = expand('<sfile>:p:h')

" Initialize base requirements.

"let g:codeine#vim_path = $VIM_PATH          " cause i'm using symlink
"call codeine#init()
"call codeine#source('./core/allkeys.vim')

source $VIM_PATH/pure/pure.vim
lua require("codeine").setup()

" lua require("init").setup()
" source $VIM_PATH/lua/codeine/plugins/cfg/whichkey.vim

" https://www.reddit.com/r/vim/comments/e95trd/a_very_useful_vim_default_command/
" nnoremap gx :execute 'silent! !xdg-open "<cfile>" &> /dev/null &' <bar> redraw! <CR>


" Initialize Base Requirements:
" if has('vim_starting')
"     " Standard_Plugins: 
"     " ================= {{{
"     " For now i just copying
"     let g:loaded_gloaded = 1
"     let g:loaded_2html_plugin      = 1 "$VIMRUNTIME/plugin/tohtml.vim
"     let g:loaded_getscript         = 1 "$VIMRUNTIME/autoload/getscript.vim
"     let g:loaded_getscriptPlugin   = 1 "$VIMRUNTIME/plugin/getscriptPlugin.vim
"     let g:loaded_gzip              = 1 "$VIMRUNTIME/plugin/gzip.vim
"     let g:loaded_logipat           = 1 "$VIMRUNTIME/plugin/logiPat.vim
"     let g:loaded_logiPat           = 1 "$VIMRUNTIME/plugin/logiPat.vim
"     let g:loaded_matchparen        = 1 "$VIMRUNTIME/plugin/matchparen.vim
"     let g:loaded_netrw             = 1 "$VIMRUNTIME/autoload/netrw.vim
"     let g:loaded_netrwFileHandlers = 1 "$VIMRUNTIME/autoload/netrwFileHandlers.vim
"     let g:loaded_netrwPlugin       = 1 "$VIMRUNTIME/plugin/netrwPlugin.vim
"     let g:loaded_netrwSettings     = 1 "$VIMRUNTIME/autoload/netrwSettings.vim
"     let g:loaded_rrhelper          = 1 "$VIMRUNTIME/plugin/rrhelper.vim
"     let g:loaded_spellfile_plugin  = 1 "$VIMRUNTIME/plugin/spellfile.vim
"     let g:loaded_sql_completion    = 1 "$VIMRUNTIME/autoload/sqlcomplete.vim
"     let g:loaded_syntax_completion = 1 "$VIMRUNTIME/autoload/syntaxcomplete.vim
"     let g:loaded_tar               = 1 "$VIMRUNTIME/autoload/tar.vim
"     let g:loaded_tarPlugin         = 1 "$VIMRUNTIME/plugin/tarPlugin.vim
"     let g:loaded_vimball           = 1 "$VIMRUNTIME/autoload/vimball.vim
"     let g:loaded_vimballPlugin     = 1 "$VIMRUNTIME/plugin/vimballPlugin.vim
"     let g:loaded_zip               = 1 "$VIMRUNTIME/autoload/zip.vim
"     let g:loaded_zipPlugin         = 1 "$VIMRUNTIME/plugin/zipPlugin.vim
"     let g:vimsyn_embed             = 1 "$VIMRUNTIME/syntax/vim.vim
"     " ================= }}}
" 
" 	" Global Mappings:
"     " ================ {{{
" 	" Use spacebar as leader and ; as secondary-leader
" 	" Required before loading plugins!
" 	let g:mapleader="\<Space>"
" 	let g:maplocalleader=','
" 
" 	" Release keymappings prefixes, evict entirely for use of plug-ins.
" 	nnoremap <Space>  <Nop>
" 	xnoremap <Space>  <Nop>
" 	nnoremap ,        <Nop>
" 	xnoremap ,        <Nop>
" 	"nnoremap ;        <Nop>
" 	"xnoremap ;        <Nop>
"     " ================ }}}
" 
"     " Setup Python:
"     " ============= {{{
"     if ! has('nvim') && has('pythonx')
"         if has('python3')
"             set pyxversion=3
"         elseif has('python')
"             set pyxversion=2
"         endif
"     endif
"     " ============= }}}
" endif
" 
" let g:syntastic_vim_checkers = ['vint']





" XXX: Custom settings
" ..., mb learn more in vimrc or his Github Repo







" Does this need abspath ?
" execute 'source' expand('<sfile>:h').'/core/vimrc'

"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath=&runtimepath
"source ~/.vimrc

"if &compatible
"  set nocompatible
"endif
"" Add the dein installation directory into runtimepath
"set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim
"
"if dein#load_state('~/.cache/dein')
"  call dein#begin('~/.cache/dein')
"
"  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
"
"  call dein#end()
"  call dein#save_state()
"endif
"
"filetype plugin indent on
"syntax enable

" vim: set ts=2 sw=2 tw=80 noet :
