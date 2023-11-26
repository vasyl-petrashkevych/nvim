local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
local plugins = {
  'wbthomason/packer.nvim',

  -- Editor plugins --
  "nvim-lua/plenary.nvim",
  {
    "MunifTanjim/nui.nvim",
    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
      }
    } },
  {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  },
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  'lewis6991/gitsigns.nvim',
  -- 'tpope/vim-fugitive',
  'dinhhuy258/git.nvim', -- For git blame & browse
  'nvim-telescope/telescope.nvim',
  'nvim-telescope/telescope-file-browser.nvim',
  'RRethy/vim-illuminate',
  'folke/trouble.nvim',
  -- Editor plugins end --

  -- Coding --
  'MunifTanjim/prettier.nvim',
  'MunifTanjim/eslint.nvim',
  'echasnovski/mini.pairs',
  'echasnovski/mini.surround',
  'echasnovski/mini.comment',
  'windwp/nvim-ts-autotag',
  'L3MON4D3/LuaSnip',
  'hrsh7th/cmp-nvim-lsp',            -- nvim-cmp source for neovim's built-in LSP
  "hrsh7th/cmp-path",
  'hrsh7th/cmp-buffer',              -- nvim-cmp source for buffer words
  'hrsh7th/nvim-cmp',                -- Completion
  'jose-elias-alvarez/null-ls.nvim', --  Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  'mhartington/formatter.nvim',
  -- Coding end --

  -- LSP --
  'neovim/nvim-lspconfig', -- LSP
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  -- LSP end

  -- UI --
  'nvim-lualine/lualine.nvim', -- Statusline
  'akinsho/nvim-bufferline.lua',
  'onsails/lspkind-nvim',      -- vscode-like pictograms
  'folke/lsp-colors.nvim',
  'norcalli/nvim-colorizer.lua',
  'nvimdev/lspsaga.nvim', -- LSP UIs
  "nvim-tree/nvim-web-devicons",
  'tjdevries/colorbuddy.nvim',
  {
    'svrana/neosolarized.nvim',
    depenencies = { 'tjdevries/colorbuddy.nvim' }
  },
  "lukas-reineke/indent-blankline.nvim",
}
local options = {}
require("lazy").setup(plugins, options)
