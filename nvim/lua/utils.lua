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
Plug('neoclide/coc.nvim', {branch = 'master', ['do'] = 'yarn install --frozen-lockfile'})
Plug 'codota/tabnine-vim'
Plug 'voldikss/vim-floaterm'

Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

-- display plugins
Plug 'Yggdroot/indentLine'

-- snippets
Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'honza/vim-snippets'

Plug('junegunn/fzf', {['do'] = vim.fn['fzf#install']})
Plug 'junegunn/fzf.vim'
Plug 'markonm/traces.vim'
Plug 'airblade/vim-rooter'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'glepnir/lspsaga.nvim'

Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
