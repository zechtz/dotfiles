set encoding=utf-8
set shell=/bin/sh

let g:python_host3_prog = '/usr/bin/python3'
let g:move_key_modifier = 'C'

set background=dark
set inccommand=nosplit
set textwidth=120

set guifont=Fira\ Code:h12

"This is only necessary if you use "set termguicolors".
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" fixes glitch? in colors when using vim with tmux

" automatically save the edited but not saved file
" when switching buffers
set autowriteall

"allow for project specific vimrc
set exrc

" don't pretend that i want to use vi
set nocompatible

" must be there for syntax highlighting
syntax on

" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on

set path+=**

" show line numbers in gutter
set number

"show relative linenumber in the gutter
set relativenumber

set numberwidth=5
set incsearch
set ignorecase

"Makes scrolling faster
set lazyredraw

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed

"-----------------------------------------------------------------"
" Allow copying and pasting from clipboard make sure vim comes bundled
" with xterm_clipboard vim --version should show +xterm_clipboard run sudo apt-get install vim-nox
"-----------------------------------------------------------------"
set clipboard=unnamedplus

" Enhance command-line completion (displays all matching files when we tab complete)
set wildmenu

" Don’t add empty newlines at the end of files
"set binary
"set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.config/nvim/backups
set directory=~/.config/nvim/swaps

set undofile                " Maintain undo history between sessions
set undolevels=10000        " How many undos
set undoreload=10000        " number of lines to save for undo

if exists("&undodir")
  set undodir=~/.config/nvim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Highlight current line
set cursorline

" let typescript pluging chain methods
setlocal indentkeys+=0.

"Saves time; maps the spacebar to colon
"-----------------------------------------------------------------"
" Automatic commands
if has("autocmd")
  " Enable file type detection
  filetype on
  " Treat .json files as .js
  "autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
  autocmd BufNewFile,BufRead *.conf setfiletype=ruby syntax=ruby
endif

"create the tags
"command! MakeTags !ctags -R .
command! MakeTags !ctags -R --exclude=*.js .

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM AUTOCMDS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!
  autocmd FileType text setlocal textwidth=78
  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

  "for ruby, autoindent with two spaces, always expand tabs
  autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et
  autocmd FileType python set sw=4 sts=4 et

  autocmd! BufRead,BufNewFile *.sass setfiletype=css
  autocmd! BufRead,BufNewFile *.scss setfiletype=css
  autocmd! BufRead,BufNewFile *.cap setfiletype=ruby
  autocmd! BufRead,BufNewFile *.conf setfiletype=conf
  autocmd! BufRead,BufNewFile *.ejs setfiletype=html
  autocmd! BufRead,BufNewFile *.blade.php set filetype=html
  autocmd! BufRead,BufNewFile *.cshtml set filetype=html
  autocmd! BufRead,BufNewFile *.ejs set filetype=html

  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
  autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;

  "Don't syntax highlight markdown because it's often wrong
  autocmd! FileType mkd setlocal syn=off

  " Leave the return key alone when in command line windows, since it's used
  " to run commands there.
  autocmd! CmdwinEnter * :unmap <cr>
  autocmd! CmdwinLeave * :call MapCR()

  " *.md is markdown
  autocmd! BufNewFile,BufRead *.md setlocal ft=

  " indent slim two spaces, not four
  autocmd! FileType *.slim set sw=2 sts=2 et
augroup END

" Treat .md files as Markdown
autocmd BufNewFile,BufRead *.md setlocal filetype=markdown

set expandtab
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
set tabstop=2
:retab %             " Retabulate the whole file

"set list
"set listchars=tab:.\ ,eol:¬
"set listchars+=trail:◥
"set listchars+=extends:❯
"set listchars+=precedes:❮
"set listchars+=nbsp:.
"set listchars+=space:.

"vertical splits less gap between bars
set fillchars+=vert:.

"Highlight current line
set cursorline
"set nocursorline
set cmdheight=2

"turn on spell checking
" setlocal spell spelllang=en_us

syntax enable
set t_Co=256

"set background=dark

"set foldmethod=manual
set foldmethod=syntax
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

" Ignore these directories
set wildignore+=*/.sass-cache/**
set wildignore+=*/vendor/**

set autoindent
set smartindent

"let g:indentLine_leadingSpaceChar='.'
"let g:indentLine_char = '|'
"let g:indentLine_char = '  '
"let g:indentLine_color_term = 233
"let g:indentLine_setColors = 0
"disable indentline by default
let g:indentLine_enabled = 0

"-----------------------------------------------------------------"
" Word wrapping that doesn't do a word in half
"-----------------------------------------------------------------"
set wrap
set linebreak

"-----------------------------------------------------------------"
" Alphabetically sort CSS properties in file with :SortCSS
"-----------------------------------------------------------------"
:command! SortCSS :g#\({\n\)\@<=#.,/}/sort

"-----------------------------------------------------------------"
" show matching brackets
"-----------------------------------------------------------------"
set showmatch

"-----------------------------------------------------------------"
" Set a different background color on gutter
"-----------------------------------------------------------------"
"Do not show gutter background color
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow
highlight SpecialKey ctermbg=none

"Added this to see if highlight goes
"when using molokai, this will show gutter color similar
"editor window color
"highlight LineNr ctermbg=233
"highlight LineNr ctermbg=none
highlight LineNr ctermfg=DarkGrey
highlight Comment ctermfg=DarkGrey

" set cursoline bg color to none
highlight CursorLine ctermbg=NONE
"highlight CursorLine ctermbg=235
"highlight Normal ctermbg=black

"SignColumn is the gutter
"highlight SignColumn ctermbg=235

"do not highlight cursor line number
"highlight CursorLineNr cterm=none

" don't show the tilde's background
"highlight EndOfBuffer ctermfg=bg

" show different cursors depending on mode
:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul

" empty lines displayed as ~ should not be highlighted with any color
highlight NonText ctermbg=none

" execute a command and show it's output in a split window
command! -nargs=* -complete=shellcmd Rsplit execute "new | r! <args>"

" set comments to be in italics
highlight Comment cterm=italic
set t_ZH=[3m
set t_ZR=[23m

"-------------------Auto-Commands----------------"
"Automatically source the .vimrc file on save
augroup sourcing
  autocmd!
  autocmd BufWritePost init.vim source %
augroup END

" auto complete with case insesitive
set wildignorecase

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

set termguicolors

"set rtp+=~/.fzf
"https://github.com/mathiasbynens/dotfiles
"
" execute a command and show it's output in a new tab
" command! -nargs=* -complete=shellcmd Rtab execute "tabnew | r! <args>"
