local Plug = vim.fn['plug#']

Plug 'godlygeek/tabular'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'editorconfig/editorconfig-vim'
Plug 'Townk/vim-autoclose'
Plug('Shougo/vimproc.vim', {['do'] = 'make'})
Plug 'vim-syntastic/syntastic'
Plug 'kchmck/vim-coffee-script'
Plug 'teto/vim-listchars'
Plug 'ntpeters/vim-better-whitespace'
Plug 'junegunn/vim-easy-align'
Plug 'isnowfy/python-vim-instant-markdown'
Plug 'matze/vim-move'
Plug 'machakann/vim-highlightedyank'
Plug 'ivalkeen/vim-simpledb'
Plug 'vim-scripts/dbext.vim'
Plug 'nvie/vim-flake8'
Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-jdaddy'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'tmux-plugins/vim-tmux'
Plug 'mhinz/vim-mix-format'
Plug 'dense-analysis/ale'
Plug 'chrisbra/sudoedit.vim'
Plug 'posva/vim-vue'
Plug 'othree/html5.vim'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'rust-lang/rust.vim'
Plug 'alx741/vim-rustfmt'
Plug('lvht/phpcd.vim', {['for'] = 'php', ['do'] = 'composer install' })
--Plug('neoclide/coc.nvim', {branch = 'master', ['do'] = 'yarn install --frozen-lockfile'})
Plug 'codota/tabnine-vim'
Plug 'voldikss/vim-floaterm'

Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

-- display plugins
Plug 'Yggdroot/indentLine'

Plug('junegunn/fzf', {['do'] = vim.fn['fzf#install']})
Plug 'junegunn/fzf.vim'
Plug 'markonm/traces.vim'
Plug 'airblade/vim-rooter'

-- telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

-- Display Dashboard
Plug 'goolord/alpha-nvim'

-- Add colors to css definitions
Plug 'norcalli/nvim-colorizer.lua'

-- Session Manager
Plug 'Shatur/neovim-session-manager'


-- intellesense
Plug 'glepnir/lspsaga.nvim'

 -- DAP ( for debugging )
 Plug 'mfussenegger/nvim-dap'
 Plug 'theHamsta/nvim-dap-virtual-text'
 Plug 'rcarriga/nvim-dap-ui'
 Plug 'Pocco81/DAPInstall.nvim'

-- cmp plugins
Plug 'hrsh7th/nvim-cmp' -- The completion plugin
Plug 'hrsh7th/cmp-buffer' -- buffer completions
Plug 'hrsh7th/cmp-path' -- path completions
Plug 'hrsh7th/cmp-cmdline' -- cmdline completions
Plug 'saadparwaiz1/cmp_luasnip' -- snippet completions
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-emoji'
Plug 'hrsh7th/cmp-nvim-lua'

-- snippets
Plug 'L3MON4D3/LuaSnip' --snippet engine
Plug 'rafamadriz/friendly-snippets' -- a bunch of snippets to Plug

-- LSP
Plug 'neovim/nvim-lspconfig' -- enable LSP
Plug 'williamboman/nvim-lsp-installer' -- simple to Plug language server installer
Plug 'tamago324/nlsp-settings.nvim' -- language server settings defined in json for
Plug 'jose-elias-alvarez/null-ls.nvim' -- for formatters and linters
Plug 'filipdutescu/renamer.nvim'
Plug 'simrat39/symbols-outline.nvim'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'

-- Java
Plug 'mfussenegger/nvim-jdtls'

-- popup windows
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
