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
    theme= 'onedark',
	component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    
	disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
  },
}
-- Bufferline
require("bufferline").setup{
  options = {
   buffer_close_icon = '',
   close_icon = '',
   left_trunc_marker = '',
   right_trunc_marker = '',
   color_icons = true,
   show_buffer_icons = true,
   offsets = {
       {
           filetype = "NvimTree",
           text = "File Explorer",
           text_align = "center",
           separator = true,
       },
      },
  },
}

-- Nvim tree
require("nvim-tree").setup({
  filters = {
    dotfiles = false,
    exclude = { vim.fn.stdpath "config" .. "/lua/custom" },
  },
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  ignore_ft_on_setup = { "alpha" },
  hijack_cursor = true,
  hijack_unnamed_buffer_when_opening = false,
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = false,
  },
  view = {
    adaptive_size = true,
    side = "left",
    width = 25,
    hide_root_folder = true,
  },
  git = {
    enable = false,
    ignore = true,
  },
  filesystem_watchers = {
    enable = true,
  },
  actions = {
    open_file = {
      resize_window = true,
    },
  },
  renderer = {
    highlight_git = false,
    highlight_opened_files = "none",

    indent_markers = {
      enable = false,
    },

    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = false,
      },

      glyphs = {
        default = "",
        symlink = "",
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
          symlink_open = "",
          arrow_open = "",
          arrow_closed = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
})
-- Gitsigns
require('gitsigns').setup {
  signs = {
    add = { hl = 'GitGutterAdd', text = '|' },
    change = { hl = 'GitGutterChange', text = '|' },
    delete = { hl = 'GitGutterDelete', text = '_' },
    topdelete = { hl = 'GitGutterDelete', text = '‾' },
    changedelete = { hl = 'GitGutterChange', text = '~' },
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

--
local cmp = require("cmp")
      cmp.setup {
        window = {
          completion = cmp.config.window.bordered()
        },
        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm{ select = false },
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, {"i", "s"}),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end)
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "path" }
        }, {
          { name = "buffer" },
        })
      }

    cmp.setup.cmdline({"/"}, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" }
      }
    })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" }
      }, {
        { name = "cmdline" }
      })
    })
--


local api = vim.api
local g = vim.g
local opt = vim.opt
local keymap = vim.api.nvim_set_keymap

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
keymap("n", "<Space>f", ":NvimTreeToggle<CR>", {silent = true} )
keymap("n", "<Space>t", ":ToggleTerm<CR>", {silent = true} )
