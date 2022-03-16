local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- let packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install plugins using packer here
return packer.startup(function(use)
	-- plugins here
	use("wbthomason/packer.nvim") -- let packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use("numToStr/Comment.nvim") -- comment plugin/ instead of nerdcommenter
	use("folke/which-key.nvim") -- never forget you key mappings again
	use("akinsho/toggleterm.nvim") -- display termial inside vim
	use("ahmedkhalf/project.nvim")
	use("lewis6991/impatient.nvim")
	use("folke/zen-mode.nvim") -- distraction free mode for vim
	use("goolord/alpha-nvim") -- a nice vim dashboard
	use("ThePrimeagen/harpoon")
	use({ "kyazdani42/nvim-tree.lua", commit = "f183c7f31197ae499c3420341fb8b275636a49b8" })
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight
	use("rcarriga/nvim-notify")
	use("folke/lua-dev.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("tpope/vim-surround") -- surround characters shortcuts
	use("andymass/vim-matchup")
	use("nacro90/numb.nvim")
	use("monaqa/dial.nvim")
	use("kevinhwang91/nvim-bqf")
	use("MattesGroeger/vim-bookmarks")
	use("lunarvim/vim-solidity")
	use("tpope/vim-repeat")
	use("tversteeg/registers.nvim")
	use("nyngwang/NeoZoom.lua")
	use({ "michaelb/sniprun", run = "bash ./install.sh" })
	use("pierreglaser/folding-nvim")
	use({

		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		ft = "markdown",
	})

	-- colorschemes
	use("folke/tokyonight.nvim") -- a nice dark color theme
	use("lunarvim/colorschemes") -- A bunch of colorschemes you can try out
	use("lunarvim/darkplus.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("rose-pine/neovim")
	use("sonph/onehalf")
	use("joshdick/onedark.vim")
	use("morhetz/gruvbox")
	use("altercation/vim-colors-solarized")
	use("antlypls/vim-colors-codeschool")
	use("tomasr/molokai")
	use("jpo/vim-railscasts-theme")
	use("gosukiwi/vim-atom-dark")
	use("trevordmiller/nova-vim")
	use("ayu-theme/ayu-vim")
	use("gregsexton/Atom")
	use("endel/vim-github-colorscheme")
	use("connorholyday/vim-snazzy")
	use("lifepillar/vim-solarized8")
	use("arcticicestudio/nord-vim")
	use("whatyouhide/vim-gotham")
	use("NLKNguyen/papercolor-theme")
	use("EdenEast/nightfox.nvim")
	use("rebelot/kanagawa.nvim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("ChristianChiarulli/nvim-ts-rainbow")
	use("nvim-treesitter/playground")
	use("windwp/nvim-ts-autotag")
	use("romgrk/nvim-treesitter-context")
	use("mizlan/iswap.nvim")

	-- DAP for debugging
	use("mfussenegger/nvim-dap")
	use("theHamsta/nvim-dap-virtual-text")
	use("rcarriga/nvim-dap-ui")
	use("Pocco81/DAPInstall.nvim")

	-- restore the cursor position
	use({ "farmergreg/vim-lastplace" })

	-- Git
	use("lewis6991/gitsigns.nvim")
	use("f-person/git-blame.nvim")
	use("ruifm/gitlinker.nvim")
	use("mattn/vim-gist")
	use("mattn/webapi-vim")
	use("https://github.com/rhysd/conflict-marker.vim")
	use("airblade/vim-gitgutter")
	use("tpope/vim-fugitive")

	-- NerdTree i still prefer this one to nvim-tree
	-- use("scrooloose/nerdtree")
	-- use("Xuyuanp/nerdtree-git-plugin")
	-- use("tiagofumo/vim-nerdtree-syntax-highlight")

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use("tom-anders/telescope-vim-bookmarks.nvim")
	use("nvim-telescope/telescope-media-files.nvim")
	use("nvim-telescope/telescope-ui-select.nvim")
	use("nvim-telescope/telescope-file-browser.nvim")

	-- Session Manager
	use("Shatur/neovim-session-manager")

	-- intellesense
	use("glepnir/lspsaga.nvim")

	-- Java language Server
	use("mfussenegger/nvim-jdtls")
	use("RishabhRD/nvim-lsputils")
	use("RishabhRD/popfix")

	-- code formatters
	use("mhartington/formatter.nvim")

	-- linter and formatter
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = {
			"nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
			"neovim/nvim-lspconfig", -- enable LSP
		},
		config = function()
			require("user/lsp/null-ls")
		end,
	})

	-- LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	use("filipdutescu/renamer.nvim")
	use("simrat39/symbols-outline.nvim")
	use("ray-x/lsp_signature.nvim")
	use("b0o/SchemaStore.nvim")
	use({
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
	})
	use("github/copilot.vim")
	use("RRethy/vim-illuminate")

	-- cmp plugins
	use({ "hrsh7th/nvim-cmp", commit = "d93104244c3834fbd8f3dd01da9729920e0b5fe7" }) -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-emoji")
	use("hrsh7th/cmp-nvim-lua")
	use({
		"tzachar/cmp-tabnine",
		config = function()
			local tabnine = require("cmp_tabnine.config")
			tabnine:setup({
				max_lines = 1000,
				max_num_results = 20,
				sort = true,
			})
		end,

		run = "./install.sh",
		requires = "hrsh7th/nvim-cmp",
	})
	-- use 'David-Kunz/cmp-npm' -- doesn't seem to work

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- emmet AKA zen coding
	use("mattn/emmet-vim")

	-- Lua
	use({
		"folke/twilight.nvim",
		config = function()
			require("twilight").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	-- elm
	use("elmcast/elm-vim")

	use("norcalli/nvim-colorizer.lua")
	use("windwp/nvim-spectre")

	use("vim-airline/vim-airline") -- for nice status bars
	use("lukas-reineke/indent-blankline.nvim")

	-- language specific plugins

	-- syntax highlightign
	use("chr4/nginx.vim")
	use("leafOfTree/vim-vue-plugin")
	use("dart-lang/dart-vim-plugin")
	use("natebosch/vim-lsc")
	use("natebosch/vim-lsc-dart")
	use("adoy/vim-php-refactoring-toolbox")
	use("prettier/vim-prettier")

	-- vim-go
	use("fatih/vim-go")

	-- phpcsfixer
	use("stephpy/vim-php-cs-fixer")
	use("editorconfig/editorconfig-vim")

	-- elixir
	use({ "elixir-lang/vim-elixir", ft = "elixir" })
	use({ "mattreduce/vim-mix", ft = "elixir" })
	use({ "slashmili/alchemist.vim", ft = "elixir" })

	-- protocol buffers
	use("uarun/vim-protobuf")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
