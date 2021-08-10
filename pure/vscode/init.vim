if exists('g:vscode')
  source $HOME/.config/nvim/vscode/vscode.vim

  function s:forceLocalOptions() 
     setlocal relativenumber 
  endfunction
endif
