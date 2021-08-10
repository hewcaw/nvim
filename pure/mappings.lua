local vim = vim

local mappings = {}

-- FIXME: Not working.
local function leader()
  if vim.fn.has('vim_starting') then
    vim.g.mapleader = " "
    vim.fn.nvim_set_keymap('n',' ','',{noremap = true})
    vim.fn.nvim_set_keymap('x',' ','',{noremap = true})

    -- Local leader
    vim.g.maplocalleader = ","
    vim.fn.nvim_set_keymap('n',',','',{noremap = true})
    vim.fn.nvim_set_keymap('x',',','',{noremap = true})
  end
end

local function misc()
  -- @see https://www.reddit.com/r/vim/comments/e95trd/a_very_useful_vim_default_command/
  vim.cmd([[nnoremap gx :execute 'silent! !xdg-open "<cfile>" &> /dev/null &' <bar> redraw! <CR>]])
end

function mappings.setup()
  -- leader()
  misc()
end

return mappings
