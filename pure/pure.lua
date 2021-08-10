local vim = vim

local pure = {}

-- @see :h standard-plugin
function disable_distribution_plugins() -- {{{
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
-- }}}

-- @see https://github.com/rafi/vim-config/blob/cea99405ff53bb4a05ad023a33454dc44603684c/config/init.vim#L85
-- function M.createdir()
--   local data_dir = {
--     global.cache_dir..'backup',
--     global.cache_dir..'session',
--     global.cache_dir..'swap',
--     global.cache_dir..'tags',
--     global.cache_dir..'undo'
--   }
--   if not global.isdir(global.cache_dir) then
--     os.execute("mkdir -p " .. global.cache_dir)
--   end
--   for _,v in pairs(data_dir) do
--     if not global.isdir(v) then
--       os.execute("mkdir -p " .. v)
--     end
--   end
-- end

local VIMPATH = os.getenv("HOME") .. '/.config/nvim'
local PUREPATH = VIMPATH .. "/lua/pure"

function pure.setup()
  require("pure/options").setup()
  require("pure/stylings").setup()
  -- vim.cmd("source" .. PUREPATH .. "/vim/filetype.vim")
  -- vim.cmd("source" .. PUREPATH .. "/vim/mappings.vim")
end

return pure

