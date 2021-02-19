"------------------------------------------------------------
"
" My init.vim File
" Maintained by: Zachariah Ngonyani
" zech@watabelabs.com
" @zechtz
" http://watabelabs.com
"------------------------------------------------------------

set encoding=utf-8
set shell=/bin/sh

" Add any plugin before plug#end() and run :PlugInstall
call plug#begin('~/.config/nvim/plugged')

"vim color schemes
Plug 'joshdick/onedark.vim'
Plug 'andreypopp/vim-colors-plain'
Plug 'antlypls/vim-colors-codeschool'
Plug 'tomasr/molokai'
Plug 'jpo/vim-railscasts-theme'
Plug 'gosukiwi/vim-atom-dark'
Plug 'w0ng/vim-hybrid'
Plug 'morhetz/gruvbox'
Plug 'whatyouhide/vim-gotham'
Plug 'altercation/vim-colors-solarized'
Plug 'NLKNguyen/papercolor-theme'
Plug 'airblade/vim-gitgutter'
Plug 'trevordmiller/nova-vim'
Plug 'noahfrederick/vim-noctu'
Plug 'logico-dev/typewriter'
Plug 'ayu-theme/ayu-vim'
Plug 'gregsexton/Atom'
Plug 'Badacadabra/vim-archery'
Plug 'endel/vim-github-colorscheme'
Plug 'keith/parsec.vim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'connorholyday/vim-snazzy'
Plug 'pveyes/atom-snazzy-clear-syntax'
Plug 'fmoralesc/molokayo'
" Solarized - variant with specific terminal support
Plug 'lifepillar/vim-solarized8'
Plug 'ruby-formatter/rufo-vim'
Plug 'arcticicestudio/nord-vim'

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
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
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

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

let g:ale_fixers = {
      \'vue': ['remove_trailing_lines', 'trim_whitespace'], 
      \'javascript': ['prettier'], 
      \'json': ['prettier'], 
      \'php': ['prettier'],
      \}
let g:ale_fix_on_save = 1

let g:rustfmt_on_save = 1

let g:ale_linter_aliases = {'vue': ['javascript', 'html', 'scss']}

"display plugins
Plug 'Yggdroot/indentLine'

"syntax
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'elixir-lang/vim-elixir'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'
Plug 'Quramy/tsuquyomi'
Plug 'othree/yajs.vim'
Plug 'othree/jsdoc-syntax.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'elzr/vim-json'
Plug 'valloric/MatchTagAlways'
Plug 'moll/vim-node'
Plug 'vim-scripts/c.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'digitaltoad/vim-pug'
Plug 'lambdatoast/elm.vim'
Plug 'StanAngeloff/php.vim'
Plug 'slashmili/alchemist.vim'
"Plug 'dansomething/vim-eclim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'prettier/vim-prettier'

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
" nginx systax Highlight
Plug 'chr4/nginx.vim'
Plug 'leafOfTree/vim-vue-plugin'

"snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Add plugins to &runtimepath
call plug#end()

let g:python_host3_prog = '/usr/bin/python3'
let g:move_key_modifier = 'C'

" Use CTRLP for c# fuzzy search

let python_highlight_all=1

let g:onedark_termcolors=256
let base16colorspace=256

let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1

" set up prettier
let g:prettier#autoformat = 1
let g:prettier#exec_cmd_async = 1
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()

" Enable rufo (RUby FOrmat)
let g:rufo_auto_formatting = 1

"colorscheme PaperColor
"colorscheme ayu
colorscheme onedark
"colorscheme snazzy
"colorscheme base16-darktooth
"colorscheme molokayo
"colorscheme onehalflight
"colorscheme molokai
"colorscheme solarized
"colorscheme nord
set background=dark 
set inccommand=nosplit

set guifont=Fira\ Code:h12

"...
"set termguicolors     " enable true colors support
let ayucolor="light"  " for light version of theme
let ayucolor="dark"   " for dark version of theme
let ayucolor="mirage" " for mirage version of theme

"This is only necessary if you use "set termguicolors".
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" fixes glitch? in colors when using vim with tmux

"My vim specific configurations, shortcuts and other stuff
let mapleader = ","
let maplocalleader = ","

"Automatically format elixir code on saving
let g:mix_format_on_save = 1
let g:mix_format_silent_errors = 1

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

"create the tags
"command! MakeTags !ctags -R .
command! MakeTags !ctags -R --exclude=*.js .

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

nmap <space> :
vmap <space> <Esc>
nmap <Leader>bb <Esc>:Tabularize/=<CR>
nmap <Leader>tb <Esc>:Tabularize/
nmap <Leader>so ysiw
nmap <Leader>st :SyntasticToggleMode<CR>

" map leader gt (,gt) to ctrl+]  => for ctags navigation
nmap <Leader>gt <c-]>
nmap <Leader>gb <c-t>

" leader ++  => encrement number under cursor, leader xx  => decrement number
nmap <Leader>++ <c-a>
nmap <Leader>aa <c-a>
nmap <Leader>xx <c-x>
nmap <Leader>dd <c-x>
imap <Leader>ff <c-x><c-f>

imap <Leader>aa <c-x><c-o>
nmap <Leader>gss <C-j>a

"Map ctrl+H to Leader HH for Vertical & Horizontal splits
nmap <Leader>HH <C-w>H
nmap <Leader>LL <C-w>L

"Map ctrl+H to Leader HH for Vertical & Horizontal splits
nmap <Leader>WW <C-w>K
nmap <Leader>WW <C-w>J

" set eclim autocomplete in insert mode to leader cc (,cc)
imap <Leader>cc <c-x><c-u>

"Just press , + s to open nerdtree
nmap <Leader>s :NERDTreeToggle<CR>

nmap <Leader>ga :Git add
nmap <Leader>gc :Git commit -m
nmap <Leader>gd :Git diff %<cr>
nmap <Leader>gp :Git push origin master<cr>
nmap <Leader>gh :Git push heroku master<cr>
nmap <Leader>gs :Git status<cr>
nmap <Leader>gb :Gblame<cr>
nmap <Leader>lt :IndentLinesToggle<CR>

nmap <Leader><space> :noh<cr>

nmap <Leader>gv :Gvdiff<CR>
nmap <Leader>lm :Limelight<CR>

"Just press , + gd to disable gitgutter and ge to enable
nmap <Leader>ggd :GitGutterDisable<CR>
nmap <Leader>gge :GitGutterEnable<CR>
nmap <Leader>r <C-r>

"Just press , + l to  nerdtree
nmap <Leader>l :GitGutterLineHighlightsToggle<CR>
let g:gitgutter_max_signs = 2048

"Just press ,w to undo the last word in insert mode
"Undo last character
imap <Leader>h <C-h>

"Undo last word
imap <Leader>ww <C-w>

"Undo last line
imap <Leader>u <C-u>

"Undo everything untill last undo
imap <Leader>ou <C-o>u

let g:ale_fixers = {
      \ 'javascript': ['eslint']
      \ }

" Navigation through splits and resize the current split
nmap <Leader>hh <C-w>h
nmap <Leader>ll <C-w>l
nmap <Leader>jj <C-w>j
nmap <Leader>kk <C-w>k
nmap <Leader>H  <C-w>H
nmap <Leader>L  <C-w>L
nmap <Leader>J  <C-w>J
nmap <Leader>K  <C-w>K
nmap <Leader>w  <C-w>
nmap <Leader>nl :set nolist<CR>
nmap <Leader>sl :set list<CR>
nmap <Leader>tn :tabNext<CR>
nmap <Leader>tp :tabprevious<CR>

" navigating through lines should be easy, don't have to gj & gk anymore
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

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

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

"vertical splits less gap between bars
set fillchars+=vert:.

" The ' key just takes back to the mark's line, the `(backtick)
" key takes you the exact position of the mark and i rarely
" use the '(signle quote) so i remap the backtick(`) to the
" signle quote key
nnoremap ' `
nnoremap ` '

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

" Set no max file limit
let g:ctrlp_max_files = 0
" Search with ctrl+p from current directory instead of project root
let g:ctrlp_working_path_mode = 0

"Just ,p instead of ctrl + p
nmap <Leader>p <C-p>
"Move back to normal mode from insert mode by typing ,]
imap <Leader>[ <Esc>

" Ignore these directories
set wildignore+=*/.sass-cache/**
set wildignore+=*/vendor/**

" Indents html on save and takes you to the top of the page
" autocmd BufRead,BufWritePre *.html normal gg=G
"-----------------------------------------------------------------"
" map ctrl + c keys to autocomplete using emmet
"-----------------------------------------------------------------"
imap <Leader>c <c-y>,
vmap <Leader>w <c-y>,

"-----------------------------------------------------------------"
"Insert a hash rocket with <c-l> saves lots of time when writing ruby
"-----------------------------------------------------------------"
imap <c-l> <space>=><space>
imap <c-k> <space>-><space>
imap <c-j> <space><-<space>

"-----------------------------------------------------------------"
"Saves time; maps the spacebar to colon
"-----------------------------------------------------------------"
nmap <space> :
nmap <Leader>bb <Esc>:Tabularize/= <cr>
nmap <Leader>tb <Esc>:Tabularize/
vmap <Leader>bb <Esc>:Tabularize/= <cr>
vmap <Leader>tb <Esc>:Tabularize/

" Move to the next buffer
nmap <leader>l :bnext<CR>
nmap <leader>tn :tabnext<CR>
 map <leader>tp :tabprevious<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

nmap <leader>bf :bfirst<CR>
nmap <leader>bf :Buffers<CR>

"-----------------------------------------------------------------"
"Fuzzy search files with ctrl.p plugin
"-----------------------------------------------------------------"
set runtimepath^=~/.vim/bundle/ctrlp.vim
" check it here https://github.com/kien/ctrlp.vim
"-----------------------------------------------------------------"
"Never have to lift your fingers just to escape insert mode ':'"
"-----------------------------------------------------------------"
imap jk <Esc><Esc>
imap jj <Esc><Esc>
imap kk <Esc><Esc>
imap .. <Esc>bgUawA

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

let g:gitgutter_highlight_lines = 1

"-----------------------------------------------------------------"
" sometimes you open a readonly file in vim but you forget to run vim with sudo
" after making changes to it, thus you wont be able to save the file this is a trick to save it
"-----------------------------------------------------------------"
cmap w!! w !sudo tee % >/dev/null

"-----------------------------------------------------------------"
" Alphabetically sort CSS properties in file with :SortCSS
"-----------------------------------------------------------------"
:command! SortCSS :g#\({\n\)\@<=#.,/}/sort

"-----------------------------------------------------------------"
" show matching brackets
"-----------------------------------------------------------------"
set showmatch
"-----------------------------------------------------------------"
" print empty <a> tag
"-----------------------------------------------------------------"
map! ;h <a href=""></a><ESC>5hi
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

"-----------------------------------------------------------------"

"-----------------------------------------------------------------"
" MULTI PURSOPSE TAB KEY
" Indent if we are at the begining of a line, else, do completion
"-----------------------------------------------------------------"
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<Tab>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
"inoremap <s-tab> <c-n>

"-----------------------------------------------------------------"
" Rename current file
"-----------------------------------------------------------------"
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'))
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <Leader>rn  :call RenameFile()<cr>

function! GetCWD()
  return expand(":pwd")
endfunction

function! IsHelp()
  return &buftype=='help'?' (help) ':''
endfunction

function! GetName()
  return expand("%:t")==''?'<none>':expand("%:t")
endfunction

set statusline=%1*[%{GetName()}]\
set statusline+=%<pwd:%{getcwd()}\
set statusline+=%2*%{&modified?'\[+]':''}%*
set statusline+=%{IsHelp()}
set statusline+=%{&readonly?'\ (ro)\ ':''}
set statusline+=[
set statusline+=%{strlen(&fenc)?&fenc:'none'}\|
set statusline+=%{&ff}\|
set statusline+=%{strlen(&ft)?&ft:'<none>'}
set statusline+=]\
set statusline+=%=
set statusline+=c%c
set statusline+=,l%l
set statusline+=/%L\

"-----------------------------------------------------------------"
" Make a directory if it doesn't exist
"-----------------------------------------------------------------"
function! s:MkNonExDir(file, buf)
  if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
    let dir=fnamemodify(a:file, ':h')
    if !isdirectory(dir)
      call mkdir(dir, 'p')
    endif
  endif
endfunction
augroup BWCCreateDir
  autocmd!
  autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

" use powerline fonts for beautiful status lines
let g:airline_powerline_fonts = 1
let g:airline_theme='onedark'

"make sure the airline status shows even on single files
set laststatus=2

" Enable the list of buffers
"let g:airline#extensions#tabline#enabled = 1

" Show just the filename
"let g:airline#extensions#tabline#fnamemod = ':t'

"-----------------------------------------------------------------"
" Use v or # to get a variable interpolation (inside of a string)}
" ysiw# Wrap the token under the cursor in #{} in Ruby
" v...s# Wrap the selection in #{}
"-----------------------------------------------------------------"
let g:surround_113 = "#{\r}"
let g:surround_35 = "#{\r}"

"-----------------------------------------------------------------"
" Select text in an ERb file with visual mode and then press s- or s=
"-----------------------------------------------------------------"
" Or yss- to do entire line.
let g:surround_45 = "<% \r %>"
let g:surround_61 = "<%= \r %>"

"-----------------------------------------------------------------"
" RubyAndRails Turn on folding in ruby files
"-----------------------------------------------------------------"
let g:ruby_fold = 1
" Highlight ruby operators
let ruby_operators = 1
" Turn off rails bits of statusbar
let g:rails_statusline=0

" enable syntasci integration with omnsharp
let g:syntastic_cs_checkers=['syntax', 'semantic', 'issues', 'eslint']

"-----------------------------------------------------------------"
" Make ctrl + p load 100% times faster, just tell it to ignore
" git files, node_modules and bower_components
"-----------------------------------------------------------------"
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

let g:ctrlp_custom_ignore = 'node_modules\|bower_compnents\|DS_Store\|git'

"-----------------------------------------------------------------"
"Vim Exchange settings
"-----------------------------------------------------------------"
nmap ex  <Plug>(Exchange)
vmap ex  <Plug>(Exchange)
xmap E   <Plug>(Exchange)
nmap exc <Plug>(ExchangeClear)
vmap exc <Plug>(ExchangeClear)
nmap exl <Plug>(ExchangeLine)
vmap exl <Plug>(ExchangeLine)

"-----------------------------------------------------------------"
" Resize the current split to at least (90,25) but no more than (140,60)
" or 2/3 of the available space otherwise.
"-----------------------------------------------------------------"
function! Splitresize()
  let hmax = max([winwidth(0), float2nr(&columns*0.66), 90])
  let vmax = max([winheight(0), float2nr(&lines*0.66), 25])
  exe "vertical resize" . (min([hmax, 140]))
  exe "resize" . (min([vmax, 60]))
endfunction

"-----------------------------------------------------------------"
" vim-go settings & key bindings
"-----------------------------------------------------------------"
let g:go_disable_autoinstall = 0
let g:go_highlight_build_constraints= 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 0

let g:go_fmt_command='goimports'
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_metalinter_command='golangci-lint'
let g:go_auto_type_info = 1

au FileType go nmap <Leader>v  <Plug>(go-def-vertical)
au FileType go nmap <Leader>in <Plug>(go-info)
au FileType go nmap <Leader>ii <Plug>(go-implements)
au FileType go nmap <leader>r  <Plug>(go-run)
au FileType go nmap <leader>b  <Plug>(go-build)
au FileType go nmap <leader>g  <Plug>(go-gbbuild)
au FileType go nmap <leader>t  <Plug>(go-test-compile)
au FileType go nmap <leader>c  <Plug>(go-coverage)
au FileType go nmap <Leader>d  <Plug>(go-doc)
au FileType go nmap <Leader>f  :GoImports<CR>

" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1

" Don't forget to start deoplete let g:deoplete#enable_at_startup = 1 "
" Less spam let g:deoplete#auto_complete_start_length = 2
" Use smartcase
let g:deoplete#enable_smart_case = 1


" Setup completion sources
let g:deoplete#sources = {}

" IMPORTANT: PLEASE INSTALL JAVACOMPLETE2  AND ULTISNIPS OR DONT ADD THIS LINE!
" =====================================

let g:deoplete#sources.java = ['jc', 'javacomplete2', 'file', 'buffer', 'ultisnips']

" =====================================

""use TAB as the mapping
inoremap <silent><expr> <TAB>
    \ pumvisible() ?  "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "" {{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction "" }}}
" end deoplete configuration

" Java completion with javacomplete2
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType java JCEnable


" Disable folding
let g:vim_markdown_folding_disabled = 1

"set rtp+=~/.fzf
"https://github.com/mathiasbynens/dotfiles
"
" execute a command and show it's output in a split window
command! -nargs=* -complete=shellcmd Rsplit execute "new | r! <args>"

" execute a command and show it's output in a new tab
" command! -nargs=* -complete=shellcmd Rtab execute "tabnew | r! <args>"

let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'

"do not load youcompleteme
"let g:loaded_youcompleteme = 1
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_server_python_interpreter = '/usr/bin/python3'

" vim-rspec mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>x :call RunNearestSpec()<CR>
map <Leader>ls :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

"typescript
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

set textwidth=120

" break lines when line length increases python files
au FileType py set autoindent
au FileType py set smartindent
" au FileType py set textwidth=79 " PEP-8 Friendly

" No Arrow keys come on man!
map <Left>  :echo "no!"<cr>
map <Right> :echo "no!"<cr>
map <Up>    :echo "no!"<cr>
map <Down>  :echo "no!"<cr>

" Ctags Mappings
nmap <Leader>ff :tag<space>
" in insert mode, press ctrl+f to make word before cursor uppercase
imap <C-F> <Esc>gUiw`]A
imap <Leader>uu <Esc>gUiw
nmap <Leader>uu gUaw

" set comments to be in italics
highlight Comment cterm=italic
set t_ZH=[3m
set t_ZR=[23m

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'javascript': { 'left': '/* ','right': ' */' } }

"for javascript development
let g:javascript_plugin_jsdoc = 1

" Ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<Leader>r"
let g:UltiSnipsJumpForwardTrigger="<Leader>f"
let g:UltiSnipsJumpBackwardTrigger="<Leader>b"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"-------------------Auto-Commands----------------"
"Automatically source the .vimrc file on save
augroup sourcing
  autocmd!
  autocmd BufWritePost init.vim source %
augroup END

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_javascript_jsxhint_exec = 'jsx-jshint-wrapper'

let g:vim_jsx_pretty_template_tags = ['html', 'raw']
let g:vim_jsx_pretty_highlight_close_tag = 1
let g:vim_jsx_pretty_colorful_config = 1

let g:go_version_warning = 0

" auto complete with case insesitive
set wildignorecase

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

function! s:base16_customize() abort
  call Base16hi("MatchParen", "g:base16_gui05", "g:base16_gui03", "g:base16_cterm05", "g:base16_cterm03", "bold,italic", "")
endfunction

augroup on_change_colorschema
  autocmd!
  autocmd ColorScheme * call s:base16_customize()
augroup END

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

" Each profile has the form:
" g:dbext_default_profile_'profilename' = 'var=value:var=value:...'
let g:dbext_default_profile_psql = 'type=PGSQL:host=localhost:port=5433:dbname=portal:user=postgres'
let g:dbext_default_profile = 'psql'
