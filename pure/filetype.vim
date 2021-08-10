augroup CoreFileType
    autocmd! 

    " Reload vim config automatically
    " Link: ../Docs/experienced.md #auto-reload-file
    autocmd BufWritePost $VIM_PATH/*.{vim,yaml} nested
    	\ source $MYVIMRC | redraw


    " Don't need these two
	"autocmd WinEnter,InsertLeave * set cursorline
	"autocmd WinLeave,InsertEnter * set nocursorline


    " When reopenning a file, jump to the position where you leave
    " (/etc/vim/vimrc) config ?
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") 
        \   | execute "normal! g'\"" | endif


    " TODO: Why I use my config ?
    " https://vim.fandom.com/wiki/Fix_syntax_highlighting
	autocmd Syntax * if 5000 < line('$') | syntax sync minlines=200 | endif
    "autocmd BufEnter * :syntax sync minlines=200       " Mine


    " https://stackoverflow.com/questions/3480264/format-css-with-vim-like-in-textmate
    " http://csstidy.sourceforge.net/
    autocmd FileType css setlocal equalprg=csstidy\ -\ --silent=true


    " TODO: Leave it here now
    autocmd BufWritePre *.js,*.jsx,*.less,*.css,*.html,*.scss,*.vue Neoformat


    " [coc.nvim] To get correct comment highlighting, add:
    " https://github.com/neoclide/coc.nvim/wiki/Using-the-configuration-file
    autocmd FileType json syntax match Comment +\/\/.\+$+


    " Go (Google) => For the fucking future
    " autocmd FileType go let b:coc_pairs_disabled = ['<']
    " autocmd InsertLeave,TextChanged,FocusLost *.go silent! wall
    " HTML (.gohtml and .tpl for server side)
    " autocmd BufNewFile,BufRead *.html,*.htm,*.gohtml,*.tpl  setf html


    " TODO: Learn later
	" https://webpack.github.io/docs/webpack-dev-server.html#working-with-editors-ides-supporting-safe-write
	autocmd FileType css,javascript,jsx,javascript.jsx
		\ setlocal backupcopy=yes  |
		\ setlocal equalprg=jslint

    " Syntax highlighting for TypescriptReact - vim-jsx-typescript
    autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

    
    " Indentation
    autocmd FileType javascript,javascriptreact setlocal shiftwidth=2
    autocmd FileType typescript,typescriptreact setlocal shiftwidth=2
    autocmd Filetype json,yaml,markdown         setlocal shiftwidth=2
    autocmd Filetype lua,vim,sh setlocal shiftwidth=2
    autocmd Filetype dart                       setlocal shiftwidth=2
    autocmd Filetype c                          setlocal shiftwidth=8


    " YAML
    " https://lornajane.net/posts/2018/vim-settings-for-working-with-yaml

    " Folding: because i can't set it like the one in general.vim
    " autocmd FileType vim,yaml setlocal foldenable foldmethod=marker foldlevel=0
    au FileType vim               setlocal foldmethod=marker
    " au FileType lua               setlocal foldmethod=syntax
    " autocmd FileType snippets          setlocal foldmethod=syntax
    " autocmd FileType dart              setlocal foldmethod=syntax foldlevel=2
    " autocmd Filetype typescript.tsx,typescript,javascript,javascriptreact
    "    \   setlocal foldmethod=syntax
    au BufRead,BufNewFile */awesome/** set foldmethod=marker


    autocmd Filetype gina-status setlocal rnu nu
    "autocmd Filetype defx        setlocal rnu nu
    

    " Micellaneous:
    " autocmd FileType text,markdown setlocal tw=0
    " autocmd Filetype coc-explorer set laststatus=0 ruler

    autocmd FileType lua nnoremap <Leader>lf
        \ :<C-u>luafile %<CR>
    autocmd Filetype vim nnoremap <Leader>vf
        \ :<C-u>source %<CR>
aug END

augroup BufferBla
    autocmd!
    autocmd BufWinEnter * if &l:buftype ==# 'help' | setlocal nofoldenable | endif
augroup END
