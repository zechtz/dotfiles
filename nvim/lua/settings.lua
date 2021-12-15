vim.cmd([[
  set encoding=utf-8
  set shell=/bin/fish
  set background=dark
  set inccommand=nosplit
  set textwidth=120
  set number
  set relativenumber
  set incsearch
  set hlsearch
  set guifont=Fira\ Code:h12
  set autowriteall
  set exrc
  syntax on
  syntax enable
  filetype plugin on

  set path+=**
  set numberwidth=5
  set ignorecase
  set lazyredraw
  set clipboard=unnamed
  set clipboard=unnamedplus
  set wildmenu
  set backupdir=~/.config/nvim/backups
  set directory=~/.config/nvim/swaps

  set undofile
  set undolevels=10000
  set undoreload=10000
  set undodir=~/.config/nvim/undo
  set backupskip=/tmp/*,/private/tmp/*
  set cursorline
  setlocal indentkeys+=0.

  set expandtab
  set shiftwidth=2
  set softtabstop=2
  set autoindent
  set smartindent
  set tabstop=2

  set fillchars+=vert:.
  set cmdheight=2

  syntax enable
  set t_Co=256

  set foldmethod=syntax
  set foldmethod=indent
  set foldnestmax=10
  set nofoldenable
  set foldlevel=1

  set wildignore+=*/.sass-cache/**
  set wildignore+=*/vendor/**

  set autoindent
  set smartindent
  set wrap
  set linebreak
  set showmatch

  set signcolumn=yes:2
  set scrolloff=8
  set sidescrolloff=8
  set nojoinspaces
  highlight clear SignColumn
  highlight GitGutterAdd ctermfg=green
  highlight GitGutterChange ctermfg=yellow
  highlight GitGutterDelete ctermfg=red
  highlight GitGutterChangeDelete ctermfg=yellow
  highlight SpecialKey ctermbg=none

  highlight LineNr ctermfg=DarkGrey
  highlight Comment ctermfg=DarkGrey

  highlight CursorLine ctermbg=NONE
  highlight NonText ctermbg=none

  highlight Comment cterm=italic
  set t_ZH=[3m
  set t_ZR=[23m
  set termguicolors
  filetype plugin on
]])

--set list
--set list listchars=tab:»-,trail:·,extends:»,precedes:«
vim.g.indentLine_enabled = 0
vim.g.gitgutter_max_signs = 2048
