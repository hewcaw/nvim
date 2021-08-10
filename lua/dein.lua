local dein = {}

local vim = vim
local config = require("config")
local utils = require("utils")

-- TODO: Lua yaml implementations:
-- Local way:
-- > package.path = package.path .. "/usr/local/share/lua/5.1/yaml/init.lua"
-- > package.path = package.path .. "/usr/local/lib/lua/5.1/yaml/core.so"
-- > require("yaml")
-- TODO: How to use planery.nvim?
-- https://leafo.net/guides/customizing-the-luarocks-tree.html#how-lua-finds-packages
-- 1. sudo luarocks install yaml
-- 2. local yaml = require("yaml")
-- 3. local cfg = yaml.load(utils.read_all(file))
-- TODO: Rename.
local function parse_plugins()
  -- local cmd = nil
  -- if global.is_mac then
  --   cmd = [[ruby -e 'require "json"; require "yaml"; print JSON.generate YAML.load $stdin.read']]
  -- elseif global.is_linux then
  --   cmd = [[python3 -c 'import sys,yaml,json; y=yaml.safe_load(sys.stdin.read()); print(json.dumps(y))']]
  -- end
  local cmd = [[python3 -c 'import sys,yaml,json; y=yaml.safe_load(sys.stdin.read()); print(json.dumps(y))']]

  local config_files = {}
  local repos = {}
  local p = io.popen('find "'..config.path.plugins..'" -name "*.yaml"')

  for file in p:lines() do
    table.insert(config_files,vim.inspect(file))
    local cfg = vim.api.nvim_eval(vim.fn.system(cmd, utils.read_all(file)))
    for _,v in pairs(cfg) do
      table.insert(repos,v)
    end
  end

  table.insert(config_files,vim.fn.expand("<sfile>"))

  return config_files, repos
end

function dein.setup()
  -- TODO: Is this neccessary?
  if vim.fn.has('vim_starting') then
    vim.api.nvim_set_var('dein#auto_recache', 1)
    vim.api.nvim_set_var('dein#install_max_processes', 12)
    vim.api.nvim_set_var('dein#install_progress_type', "title")
    vim.api.nvim_set_var('dein#enable_notification', 1)
    vim.api.nvim_set_var('dein#install_log_filename', config.path.dein .. 'dein.log')

    if not vim.o.runtimepath:match('/dein.vim') then
      if not utils.isdir(config.path.dein_plug) then
        -- FIXME: Why the above code not working?
        -- os.execute("git clone https://github.com/Shougo/dein.vim" .. config.path.dein_plug)
        os.execute("git clone https://github.com/Shougo/dein.vim ~/.cache/nvim/dein/repos/github.com/Shougo/dein.vim")
      end
      vim.o.runtimepath = vim.o.runtimepath .. ',' .. config.path.dein_plug
    end
  end

  if vim.fn['dein#load_state'](config.path.dein) == 1 then
    local config_files, repos = parse_plugins()

    vim.fn['dein#begin'](config.path.dein, config_files)
    for _, cfg in pairs(repos) do
      vim.fn['dein#add'](cfg.repo,cfg)
    end

    -- Henosis
    -- vim.fn['dein#local'](
    --   '~/.config/nvim/lua/dev/',
    --   {
    --     hook_source = "colo ayu",
    --     hook_post_source = [[
    --       lua require("henosis").setup{}
    --       lua require("henosis/themes/default").default{}
    --       nnoremap <silent> <leader>bd :<c-u>BuffetWipe<CR>
    --       nnoremap <silent> <leader>bl :<c-u>BuffetWipe #<CR>
    --       nnoremap <silent> <leader>bo :<c-u>BuffetOnly<CR>
    --       nnoremap <silent> <leader>bn :<c-u>bn <CR>
    --       nnoremap <silent> <leader>bp :<c-u>bp <CR>
    --       nnoremap <silent> <leader>bv <C-^>
    --     ]],
    --   },
    --   {"henosis.nvim"}
    -- )

    -- Barbar
    vim.fn['dein#local'](
      '~/.config/nvim/lua/dev',
      {
        hook_source = "colo ayu",
        hook_post_source = [[
          nnoremap <silent> <leader>bn :<c-u>bn <CR>
          nnoremap <silent> <leader>bp :<c-u>bp <CR>
        ]]
      },
      {"barbar.nvim"}
    )

    -- Galaxyline
    vim.fn['dein#local'](
      '~/.config/nvim/lua/dev/',
       {
        hook_source = "colo ayu",
        hook_post_source = "lua require('galaxyline/example/eviline')"
       },
      {"galaxyline.nvim"}
    )

    -- Milkyway
    --  vim.fn['dein#local'](
    --    '~/.config/nvim/lua/dev/',
        -- {
    --      hook_source = "colo ayu",
    --      hook_post_source = [[lua require("milkyway").setup {
    --        theme = "ephemeral"
    --      }]]
        -- },
    --    {"galaxyline.nvim"}
    --  )

    vim.fn['dein#end']()
    vim.fn['dein#save_state']()

    if vim.fn['dein#check_install']() == 1 then
      vim.fn['dein#install']()
    end
  end

  vim.api.nvim_command('filetype plugin indent on')
  if vim.fn.has('vim_starting') == 1 then
    vim.api.nvim_command('syntax enable')
  end

  vim.fn['dein#call_hook']('source')
  vim.fn['dein#call_hook']('post_source')
end

-- local config_files, repos = parse_plugins()
-- print("Files: " .. vim.inspect(config_files))
-- print("Repos: " .. vim.inspect(repos))

-- local cfg, repos = parse()
-- print(vim.inspect(cfg))
-- print()
-- print(vim.inspect(repos))

-- print(vim.fn.expand("<sfile>"))

-- local yaml = require("yaml")
-- local data = yaml.load("plugins/ui.yaml")
-- print(data)
-- parse()

-- local yaml_string = yaml.dump(some_table)

return dein
