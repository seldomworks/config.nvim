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

 -- init.lua

-- Load custom treesitter grammar for org filetype
require('orgmode').setup_ts_grammar()

-- Treesitter configuration
require('nvim-treesitter.configs').setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop,
  -- highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    -- Required for spellcheck, some LaTex highlights and
    -- code block highlights that do not have ts grammar
    additional_vim_regex_highlighting = {'org'},
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}

require('orgmode').setup({
  org_agenda_files = {'~/OneDrive - Qualcomm/org/*', '~/my-orgs/**/*'},
  org_default_notes_file = '~/OneDrive - Qualcomm/org/refile.org',
})
-- let s:fontsize = 14
-- function! AdjustFontSize(amount)
--   let s:fontsize = s:fontsize+a:amount
--   :execute "GuiFont! Consolas:h" . s:fontsize
-- endfunction
-- 
-- noremap <C-ScrollWheelUp> :call AdjustFontSize(1)<CR>,
-- noremap <C-ScrollWheelDown> :call AdjustFontSize(-1)<CR>
-- inoremap <C-ScrollWheelUp> <Esc>:call AdjustFontSize(1)<CR>a
-- inoremap <C-ScrollWheelDown> <Esc>:call AdjustFontSize(-1)<CR>a
