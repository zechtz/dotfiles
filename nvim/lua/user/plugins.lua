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
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim" -- comment plugin/ instead of nerdcommenter
  use "folke/which-key.nvim" -- never forget you key mappings again
  use "akinsho/toggleterm.nvim" -- display termial inside vim
  use "ahmedkhalf/project.nvim"
  use "lewis6991/impatient.nvim"
  use "folke/zen-mode.nvim"  -- distraction free mode for vim
  use "goolord/alpha-nvim" -- a nice vim dashboard
  use "ThePrimeagen/harpoon"
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "lukas-reineke/indent-blankline.nvim"
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use "rcarriga/nvim-notify"
  use "folke/lua-dev.nvim"
  use "kyazdani42/nvim-web-devicons"

  -- colorschemes
  use "folke/tokyonight.nvim" -- a nice dark color theme
  use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
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

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "ChristianChiarulli/nvim-ts-rainbow"
  use "nvim-treesitter/playground"
  use "windwp/nvim-ts-autotag"
  use 'romgrk/nvim-treesitter-context'
  use 'mizlan/iswap.nvim'

  -- DAP for debugging
  use "mfussenegger/nvim-dap"
  use "theHamsta/nvim-dap-virtual-text"
  use "rcarriga/nvim-dap-ui"
  use "Pocco81/DAPInstall.nvim"

  -- Git
  use "lewis6991/gitsigns.nvim"
  use "f-person/git-blame.nvim"
  use "ruifm/gitlinker.nvim"
  use "mattn/vim-gist"
  use "mattn/webapi-vim"

  -- NerdTree i still prefer this one to nvim-tree
  use "scrooloose/nerdtree"

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "tom-anders/telescope-vim-bookmarks.nvim"
  use "nvim-telescope/telescope-media-files.nvim"

  -- Session Manager
  use 'Shatur/neovim-session-manager'

  -- intellesense
  use 'glepnir/lspsaga.nvim'

  -- Java
  use "mfussenegger/nvim-jdtls"

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "filipdutescu/renamer.nvim"
  use "simrat39/symbols-outline.nvim"
  use 'ray-x/lsp_signature.nvim'
  use {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  }

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'} -- AI powered auto-complete
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-emoji"
  use "hrsh7th/cmp-nvim-lua"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- emmet AKA zen coding
  use 'mattn/emmet-vim'

  use "norcalli/nvim-colorizer.lua"
  use "windwp/nvim-spectre"

  use 'vim-airline/vim-airline' -- for nice status bars

  use 'yuezk/vim-js'
  use 'maxmellon/vim-jsx-pretty'

  -- syntax highlightign
  use 'chr4/nginx.vim'
  use 'leafOfTree/vim-vue-plugin'
  use 'dart-lang/dart-vim-plugin'
  use 'natebosch/vim-lsc'
  use 'natebosch/vim-lsc-dart'
  use 'adoy/vim-php-refactoring-toolbox'
  use 'prettier/vim-prettier'

  -- vim-go
  use 'fatih/vim-go'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
