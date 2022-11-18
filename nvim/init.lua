--  _____   _____ 
-- |  __ \ / ____| Rahul Sandhu
-- | |__) | (___   rahul@sandhuservices.dev
-- |  _  / \___ \  https://sandhuservices.dev/
-- | | \ \ ____) | https://gitlab.sandhuservices.dev/rahulsandhu/
-- |_|  \_\_____/  https://github.com/rahul-singh-sandhu
-- My neovim configuration files

require("plugins")

-- Pugins:
-- Lualine
require('lualine').setup {

	options = {
    icons_enabled = true,
    theme= 'codedark',
	component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    
	disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
  },
}
-- Bufferline
require("bufferline").setup{}
-- Nvim tree
require("nvim-tree").setup({
  sort_by = "case_sensitive",

  view = {
    adaptive_size = true,
    mappings = {
  
		list = {
        { key = "u", action = "dir_up" },
      },
  
  },
  },
  
  renderer = {
    group_empty = true,
  },
  
  filters = {
    dotfiles = true,
  },
})
-- Git signs
require('gitsigns').setup {
 signs = {
    add          = { hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
    change       = { hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
    delete       = { hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
    topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
    changedelete = { hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
    untracked    = { hl = 'GitSignsAdd'   , text = '┆', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  },
}
-- Nvim Tree Sitter work around
vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
  group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
  callback = function()
    vim.opt.foldmethod     = 'expr'
    vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
  end
})
-- Comment
require('Comment').setup()
-- Indent Blankline
require("indent_blankline").setup {
    show_end_of_line = true,
}

local api = vim.api
local g = vim.g
local opt = vim.opt

opt.number = true
opt.tabstop = 4
opt.shiftwidth = 4 
opt.relativenumber = true
opt.mouse = "a"
opt.ignorecase = true
opt.termguicolors = true
opt.showtabline = 2
opt.showtabline = 2
opt.list = true
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
