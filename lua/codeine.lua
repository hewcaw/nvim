local codeine = {}

function codeine.setup()
  require("dein").setup()
	vim.cmd("colo ayu")
	vim.cmd("source $VIM_PATH/lua/plugins/vimscripts/mappings.vim")
end

return codeine
