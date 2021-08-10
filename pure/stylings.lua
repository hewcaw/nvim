local vim = vim

local stylings = {}

-- @see https://vim.fandom.com/wiki/Configuring_the_cursor
local function cursor_shape()
  -- "highlight Cursor guifg=white guibg=black
  -- "highlight iCursor guifg=white guibg=blue
  if vim.fn.has('vim_starting') then
    vim.cmd("set guicursor=n-v-c:block-Cursor")
    vim.cmd("set guicursor+=i:hor25-iCursor")
    vim.cmd("set guicursor+=n-v-c:blinkon0")
  end
end

local function statusline()
  vim.o.laststatus = 2
  vim.cmd("set statusline=")
  vim.cmd([[set statusline+=%#function#\ 🥐]])
  vim.cmd([[set statusline+=\ %*]])
  vim.cmd([[set statusline+=\ ‹‹]])
  vim.cmd([[set statusline+=\ %f\ %*]])
  vim.cmd([[set statusline+=\ ››]])
  vim.cmd([[set statusline+=\ %m]])
  -- vim.cmd(""set statusline+=%#keyword#\ %F
  vim.cmd("set statusline+=%=")
  -- vim.cmd(""set statusline+=\ %{LinterStatus()})"
  vim.cmd([[set statusline+=%#keyword#\ ‹‹]])
  -- vim.cmd(""set statusline+=\ %{strftime('%R',getftime(expand('%')))}")
  vim.cmd([[set statusline+=\ %c]])
  vim.cmd([[set statusline+=\ /]])
  vim.cmd([[set statusline+=\ %p%%]])
  vim.cmd([[set statusline+=\ ::]])
  vim.cmd([[set statusline+=\ %*]])
  -- vim.cmd("set statusline+=\ 🥞")
  vim.cmd([[set statusline+=\ Buffer:]])
  vim.cmd([[set statusline+=%#keyword#\ %n]])
  vim.cmd([[set statusline+=\ ››\ %*]])
end

local function misc()
  -- if vim.fn.has('conceal')
  -- set conceallevel=3 concealcursor=niv
  vim.o.conceallevel = 0

  --  XXX: Maybe I don't need this and maybe it belongs to the UI
  -- set list
  -- set listchars=tab:»·,nbsp:+,trail:·,extends:→,precedes:←

  -- If I unif this, editing buffet.vim and save not auto reload Highlight
  if vim.fn.has('vim_starting') then
    vim.o.t_Co="256"
    vim.o.signcolumn="yes"
    vim.o.shortmess="aFc"
    vim.o.cmdheight=2
    vim.o.splitbelow = true
    vim.cmd([[set fillchars+=vert:\┃  ]])   -- add a bar for vertical splits
    vim.o.termguicolors = true

    statusline()
    -- https://stackoverflow.com/questions/2440149/override-colorscheme
  end
end

function stylings.setup()
  cursor_shape()
  misc()
end

return stylings
