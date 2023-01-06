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
  use "kyazdani42/nvim-web-devicons"
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
  use {
    'goolord/alpha-nvim',
    config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
  }
  use {'neovim/nvim-lspconfig'}
  use {'hrsh7th/cmp-nvim-lsp'}
  use {'hrsh7th/cmp-buffer'}
  use {'hrsh7th/cmp-path'}
  use {'hrsh7th/cmp-cmdline'}
  use {'hrsh7th/nvim-cmp'}
  use {'L3MON4D3/LuaSnip'}
  use {'saadparwaiz1/cmp_luasnip'}
  use "jayden-chan/base46.nvim"
end)
