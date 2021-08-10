local vim = vim

local options = {}

--- Set vim options.
-- @param opts table
local function setotps(opts)
  for name, value in pairs(opts) do
    vim.o[name] = value
  end
end

local function disable_standard_plugins()
  vim.g.loaded_gzip              = 1
  vim.g.loaded_tar               = 1
  vim.g.loaded_tarPlugin         = 1
  vim.g.loaded_zip               = 1
  vim.g.loaded_zipPlugin         = 1
  vim.g.loaded_getscript         = 1
  vim.g.loaded_getscriptPlugin   = 1
  vim.g.loaded_vimball           = 1
  vim.g.loaded_vimballPlugin     = 1
  vim.g.loaded_matchit           = 1
  vim.g.loaded_matchparen        = 1
  vim.g.loaded_2html_plugin      = 1
  vim.g.loaded_logiPat           = 1
  vim.g.loaded_rrhelper          = 1
  vim.g.loaded_netrw             = 1
  vim.g.loaded_netrwPlugin       = 1
  vim.g.loaded_netrwSettings     = 1
  vim.g.loaded_netrwFileHandlers = 1
end

-- @see https://stackoverflow.com/questions/16507777
local function set_encoding()
  if vim.fn.has('vim_starting') then
    setotps {
      encoding = "UTF-8",
      -- scriptencoding = "UTF-8",  TODO: invalid?
      fileencoding = "utf-8",
    }
  end
end

-- FIXME: Weird behaviour.
-- @see https://jeffkreeftmeijer.com/vim-number/
-- @see https://github.com/jeffkreeftmeijer/vim-numbertoggle
local function set_hybridnumber()
  -- setotps {
  --   number = true,
  --   relativenumber = true,
  -- }
  vim.cmd("set number relativenumber")
  vim.cmd('augroup HybridNumber')
  vim.cmd("autocmd!")
  -- vim.cmd("au BufEnter,FocusGained,InsertLeave * set relativenumber")
  -- vim.cmd("au BufLeave,FocusLost,InsertEnter   * set norelativenumber")
  -- vim.cmd("autocmd BufEnter,FocusGained,InsertLeave * set relativenumber")
  -- vim.cmd("autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber")
  vim.cmd("autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu | endif")
  vim.cmd("autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif")
  vim.cmd('augroup END')
end

-- TODO: Name something better.
-- @see http://albertomiorin.com/blog/2012/12/10/autoread-and-autowrite-in-vim/
local function set_io()
  vim.cmd('aug Autosave')
  vim.cmd('au!')
  vim.cmd('au FocusLost * wall')
  vim.cmd('aug END')
  setotps {
    hidden = true,
    backup = false,
    swapfile = false,
    writebackup = false,
    autoread = true,
    autowrite = true,
    autowriteall = true,
    confirm = true,
  }
end

-- @see https://www.reddit.com/r/vim/comments/3ql651/what_do_you_set_your_updatetime_to/
local function set_time()
  setotps {
    timeout = true,
    ttimeout = true,
    timeoutlen = 500,
    ttimeoutlen = 10,
    updatetime = 100,
    redrawtime = 1500,
  }
end

local function indentation()
  setotps {
    -- set textwidth=80
    tabstop = 4,
    shiftwidth = 4,
    cindent = true,
    autoindent = true,
    expandtab = true,
    softtabstop = 4,
    smarttab = true,
    smartindent = true,
    shiftround = true,
  }
end

local function completion()
  setotps {
    completefunc = "emoji#complete",
    -- set completeopt =longest,menu
    -- set completeopt-=preview
    complete       = ".,w,b,k",
    completeopt = "menu,menuone,noselect,noinsert",
  }
end

local function search()
  setotps {
    ignorecase = true,      -- Search ignoring case
    smartcase = true,       -- Keep case when searching with *
    infercase = true,       -- Adjust case in insert completion mode
    incsearch = true,       -- Incremental search
    hlsearch = true,         -- Highlight search results
    wrapscan = true,        -- Searches wrap around the end of the file
    showmatch = true,       -- Jump to matching bracket, i dont like it to jump when search
    -- matchpairs +=<:> " Add HTML brackets to pair matching
    matchtime = 1,          -- Tenths of a second to show the matching paren
    -- XXX: Why we need this ? when it in default
    -- set cpoptions-=m    " showmatch will wait 0.5s or until a char is typed
    grepprg = [[rg\ --vimgrep\ $*]],
    -- wildignore+=*.so,*~,*/.git/*,*/.svn/*,*/.DS_Store,*/tmp/*
  }
end

local function folding()
  setotps {
    foldenable = true,
    foldlevel = 5,
    foldmethod = "indent",
    foldlevelstart = 99
    -- set foldcolumn=1
    -- if has('folding')
    --   set foldenable
    -- endif
    -- 
    -- augroup remember_folds
    --   autocmd!
    --   autocmd BufWinLeave * mkview
    --   autocmd BufWinEnter * silent! loadview
    -- augroup END
  }
end

local function misc()
  if vim.fn.has('nvim') then
    setotps {shada = "'300,<50,@100,s10,h"}
  end

  vim.cmd('aug Unknown')
  vim.cmd('au!')
  vim.cmd('au CursorHold *? syntax sync minlines=300')
  vim.cmd('aug END')

  setotps {
    -- Browsing file based on buffer
    -- bsdir = "buffer",    -- TODO: invalid?

    -- Undo
    undofile = true,
    undodir = os.getenv("HOME") .. "/.tmp/undo",

    history = 1000,

    -- Backspace XXX: ???
    -- set backspace=2
    -- set backspace=indent,eol,start

    -- Italic
    -- @see https://stackoverflow.com/questions/3494435/vimrc-make-comments-italic
    -- set t_ZH=[3m
    -- set t_ZR=[23m

    -- Gitdiff
    vim.cmd("set diffopt+=vertical")
  }
end

function options.setup()
  disable_standard_plugins()
  set_encoding()
  set_hybridnumber()
  set_io()
  set_time()
  indentation()
  completion()
  search()
  folding()
  misc()
end

return options
