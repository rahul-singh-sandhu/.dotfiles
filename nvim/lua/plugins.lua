return require('packer').startup(function(use)
  -- Packer
  use 'wbthomason/packer.nvim'
  -- Lualine
  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  -- Neovim dev icons
  requires = {
    'nvim-tree/nvim-web-devicons',
  },
  -- Bufferline
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
  -- Nvim tree
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
    tag = 'nightly'
  }
  -- Nvim treesitter
  use {
        'nvim-treesitter/nvim-treesitter',
	run = ':TSUpdate'
    }
  -- Git signs
  use {
  'lewis6991/gitsigns.nvim',
  }
  -- Toggle term
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end}
  -- Comment
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
	end
  }
  -- Indent blankline
  use "lukas-reineke/indent-blankline.nvim"
end)
