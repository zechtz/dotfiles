"vim utils
Plug 'godlygeek/tabular'
Plug 'junegunn/vim-easy-align'
Plug 'kien/ctrlp.vim'
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
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
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
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
" Or build from source code by using yarn: https://yarnpkg.com
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'codota/tabnine-vim'

if has('nvim')
  "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

"display plugins
Plug 'Yggdroot/indentLine'

"snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'markonm/traces.vim'
