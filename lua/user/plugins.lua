local fn = vim.fn

-- Automatically install packer : ~/.local/share/nvim
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- SEE : https://github.com/wbthomason/packer.nvim#quickstart

  -- My plugins here
  use 'wbthomason/packer.nvim'          -- Have packer manage itself
  use 'nvim-lua/popup.nvim'             -- An implementation of the Popup API from vim in Neovim
  use 'nvim-lua/plenary.nvim'           -- Useful lua functions used in lots of plugins
  use 'numToStr/Comment.nvim'           -- gc[N][motion]
  use 'windwp/nvim-autopairs'           -- Autopairs, integrates with both cmp and treesitter
  use 'kyazdani42/nvim-web-devicons'    -- nices icons
  use 'kyazdani42/nvim-tree.lua'        -- tree explorer
  use 'akinsho/bufferline.nvim'         -- buffer status line
  -- use 'vim-airline/vim-airline'         -- Status/Tab line
  -- use 'vim-airline/vim-airline-themes'  -- Status/Tab line Themes
  use 'feline-nvim/feline.nvim'
  use 'embear/vim-localvimrc'           -- support .lvimrc
  use 'jamessan/vim-gnupg'              -- support .gpg .pgp .asc

  -- Colorschemes
  -- use 'lunarvim/colorschemes'    -- A bunch of colorschemes you can try out
  use 'lunarvim/darkplus.nvim'
  -- use 'matsen/nvim-colors-solarized'

  -- languages
  use 'habamax/vim-godot'

  -- cmp plugins
  use 'hrsh7th/nvim-cmp'            -- The completion plugin
  use 'hrsh7th/cmp-buffer'          -- buffer completions
  use 'hrsh7th/cmp-path'            -- path completions
  use 'hrsh7th/cmp-cmdline'         -- cmdline completions
  use 'saadparwaiz1/cmp_luasnip'    -- snippet completions
  use 'hrsh7th/cmp-nvim-lsp'        -- lsp completion

  -- snippets
  use 'L3MON4D3/LuaSnip'                -- snippet engine
  use 'rafamadriz/friendly-snippets'    -- a bunch of snippets to use

  -- LSP
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',              -- enable LSP
    'mfussenegger/nvim-dap',
    'jose-elias-alvarez/null-ls.nvim'     -- for formatters and linters
  }

  -- Telescope
  use 'nvim-telescope/telescope.nvim'   -- highly extendable fuzzy finder

  -- Treesitter
  use {                                 -- language syntax tree for highlight
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }
  use 'JoosepAlviste/nvim-ts-context-commentstring'   -- to help Comment
  use 'p00f/nvim-ts-rainbow'
  -- use 'nvim-treesitter/playground' -- TSHighlightCapturesUnderCursor, TSPlaygroundToggle, ...

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
