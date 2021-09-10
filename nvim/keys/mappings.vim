"My vim specific configurations, shortcuts and other stuff
let mapleader = ","
let maplocalleader = ","

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

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" The ' key just takes back to the mark's line, the `(backtick)
" key takes you the exact position of the mark and i rarely
" use the '(signle quote) so i remap the backtick(`) to the
" signle quote key
nnoremap ' `
nnoremap ` '

"Just ,p instead of ctrl + p
nmap <Leader>p <C-p>
"Move back to normal mode from insert mode by typing ,]
imap <Leader>[ <Esc>

" Indents html on save and takes you to the top of the page
" autocmd BufRead,BufWritePre *.html normal gg=G
"-----------------------------------------------------------------"
" map ctrl + c keys to autocomplete using emmet
"-----------------------------------------------------------------"
imap <Leader>c <c-y>,
vmap <Leader>w <c-y>,

"-----------------------------------------------------------------"
"Insert a hash rocket with <c-l> saves lots of time when writing ruby hashes, go channels etc
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
"Never have to lift your fingers just to escape insert mode ':'"
"-----------------------------------------------------------------"
imap jk <Esc><Esc>
imap jj <Esc><Esc>
imap kk <Esc><Esc>

"-----------------------------------------------------------------"
" sometimes you open a readonly file in vim but you forget to run vim with sudo
" after making changes to it, thus you wont be able to save the file this is a trick to save it
"-----------------------------------------------------------------"
cmap w!! w !sudo tee % >/dev/null

"-----------------------------------------------------------------"
" print empty <a> tag
"-----------------------------------------------------------------"
map! ;h <a href=""></a><ESC>5hi

inoremap <tab> <c-r>=InsertTabWrapper()<cr>
"inoremap <s-tab> <c-n>
"
"
map <Leader>rn  :call RenameFile()<cr>

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

" vim-rspec mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>x :call RunNearestSpec()<CR>
map <Leader>ls :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" No Arrow keys come on man!
map <Left>  :echo "no!"<cr>
map <Right> :echo "no!"<cr>
map <Up>    :echo "no!"<cr>
map <Down>  :echo "no!"<cr>

" Ctags Mappings
nmap <Leader>ff :tag<space>
" type double dots followed by u to make word before cursor UPPERCASE
imap <Leader>uu <Esc>bgUawA

"sorround non-quoted json keys with double quotes by pressing ,jx
noremap <Leader>jx :%s/[ \t]\([A-Za-z_].*\):/"\1":/<CR>

"sorround non-quoted json keys with double quotes by pressing ,s"
noremap <Leader>s" :%s/\([A-Z_]*\):/"\1":/<CR>

