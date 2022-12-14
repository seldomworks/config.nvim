--[[ init.lua ]]

-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
vim.g.mapleader = ","
vim.g.localleader = "\\"

-- IMPORTS
require('vars')      -- Variables
require('opts')      -- Options
require('keys')      -- Keymaps
require('plug')      -- Plugins

-- PLUGINS: Add this section
require('nvim-tree').setup{}

require('lualine').setup {
  options = {
    theme = 'dracula-nvim'
  }
}

require("mason").setup {
    log_level = vim.log.levels.DEBUG
}
local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()
