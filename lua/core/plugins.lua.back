local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Editor plugins --
  use "nvim-lua/plenary.nvim"
  use "MunifTanjim/nui.nvim"
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use 'lewis6991/gitsigns.nvim'
  use 'tpope/vim-fugitive'
  use 'dinhhuy258/git.nvim' -- For git blame & browse
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'RRethy/vim-illuminate'
  use 'folke/trouble.nvim'
  -- Editor plugins end --

  -- Coding --
  use('MunifTanjim/prettier.nvim')
  use 'MunifTanjim/eslint.nvim'
  use 'echasnovski/mini.pairs'
  use 'echasnovski/mini.surround'
  use 'echasnovski/mini.comment'
  use 'windwp/nvim-ts-autotag'
  use 'L3MON4D3/LuaSnip'
  use 'hrsh7th/cmp-nvim-lsp'            -- nvim-cmp source for neovim's built-in LSP
  use "hrsh7th/cmp-path"
  use 'hrsh7th/cmp-buffer'              -- nvim-cmp source for buffer words
  use 'hrsh7th/nvim-cmp'                -- Completion
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use { 'mhartington/formatter.nvim' }

  -- Coding end --

  -- LSP --
  use 'neovim/nvim-lspconfig' -- LSP
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  -- LSP end

  -- UI --
  use 'nvim-lualine/lualine.nvim' -- Statusline
  use 'akinsho/nvim-bufferline.lua'
  use 'onsails/lspkind-nvim'      -- vscode-like pictograms
  use 'folke/lsp-colors.nvim'
  use 'norcalli/nvim-colorizer.lua'
  use 'nvimdev/lspsaga.nvim' -- LSP UIs
  use "nvim-tree/nvim-web-devicons"
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }
  use "lukas-reineke/indent-blankline.nvim"
  -- UI end --

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
