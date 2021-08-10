local config = {}

local nvim = os.getenv("HOME") .. "/.config/nvim"
local dein = os.getenv("HOME") .. "/.cache/nvim/dein"

config.path = {
  nvim = nvim,
  dein = dein,
  dein_plug = dein .. "/repos/github.com/Shougo/dein.vim",
  plugins = nvim .. "/lua/plugins",
}

return config
