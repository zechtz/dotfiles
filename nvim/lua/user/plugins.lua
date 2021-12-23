local fn = vim.fn

-- Automatically install packer
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

-- let packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install plugins using packer here
return packer.startup(function(use)
  -- plugins here
  use "wbthomason/packer.nvim" -- let packer manage itself
  use "nvim-lua/popup.nvim" -- An impletation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- An impletation of the Popup API from vim in Neovim

  -- color schemes
  use "lunarvim/colorschemes"
  use "folke/tokyonight.nvim" -- a nice dark color theme
  use "lunarvim/darkplus.nvim"
  use "catppuccin/nvim"
  use "rose-pine/neovim"
  use "sonph/onehalf"
  use "joshdick/onedark.vim"
  use 'morhetz/gruvbox'
  use 'altercation/vim-colors-solarized'
  use 'antlypls/vim-colors-codeschool'
  use 'tomasr/molokai'
  use 'jpo/vim-railscasts-theme'
  use 'gosukiwi/vim-atom-dark'
  use 'trevordmiller/nova-vim'
  use 'ayu-theme/ayu-vim'
  use 'gregsexton/Atom'
  use 'endel/vim-github-colorscheme'
  use 'connorholyday/vim-snazzy'
  use 'lifepillar/vim-solarized8'
  use 'arcticicestudio/nord-vim'
  use 'whatyouhide/vim-gotham'
  use 'NLKNguyen/papercolor-theme'
  use 'EdenEast/nightfox.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
