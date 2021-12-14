vim.g.mapleader = ','
vim.g.maplocalleader = ','

local function map(mode, shortcut, command)
  local opts = {}
  vim.api.nvim_set_keymap(mode, shortcut, command, opts)
end

local function nmap(shortcut, command)
  map('n', shortcut, command)
end

local function imap(shortcut, command)
  map('i', shortcut, command)
end

local function smap(shortcut, command)
  map('s', shortcut, command)
end

local function vmap(shortcut, command)
  map('v', shortcut, command)
end

local function xmap(shortcut, command)
  map('x', shortcut, command)
end

local function noremap(shortcut, command)
  vim.api.nvim_set_keymap('n', shortcut, command, { noremap = true, silent = true })
end

nmap('<Space>', ':')
vmap('<Space>', '<Esc>')

nmap('<Leader>h', ':set hlsearch')
nmap('<Leader><Space>', ':noh<CR>')

nmap('<Leader>S', ':source ~/.config/nvim/init.lua<CR>')
nmap('<Leader>E', ':edit ~/.config/nvim/init.lua<CR>')

-- Open the current file in the default program
nmap('<Leader>x', ':!xdg-open %<CR><CR>')

-- Allow gf to open non-existent file
nmap('gf', ':edit <cfile><CR>')

-- map leader gt (,gt) to ctrl+]  => for ctags navigation
nmap('<Leader>gt', '<c-]>')
nmap('<Leader>gb', '<c-t>')

--leader ++  => encrement number under cursor, leader xx  => decrement number
nmap('<Leader>++', '<c-a>')
nmap('<Leader>aa', '<c-a>')
nmap('<Leader>xx', '<c-x>')
nmap('<Leader>dd', '<c-x>')
nmap('<Leader>ff', '<c-x><c-f>')

nmap('<Leader>aa', '<c-x><c-o>')
nmap('<Leader>gss', '<C-j>a')

-- Map ctrl+H to Leader HH for Vertical & Horizontal splits
nmap('<Leader>HH', '<C-w>H')
nmap('<Leader>LL', '<C-w>L')

-- Map ctrl+H to Leader HH for Vertical & Horizontal splits
nmap('<Leader>WW', '<C-w>K')
nmap('<Leader>WW', '<C-w>J')

-- set eclim autocomplete in insert mode to leader cc (,cc)
imap('<Leader>cc ', '<c-x><c-u>')
vmap('<Leader>/ ', '<c-x><c-u>')

-- Just press , + s to open nerdtree
nmap('<Leader>s', ':NERDTreeToggle<CR>')
-- nmap('<Leader>s', ':Lexplore<CR>')

nmap('<Leader>ga', ':Git add')
nmap('<Leader>gc', ':Git commit -m')
nmap('<Leader>gd', ':Git diff %<CR>')
nmap('<Leader>gp', 'push origin master<CR>')
nmap('<Leader>gs', ':Git status<CR>')
nmap('<Leader>gb', ':Gblame<CR>')
nmap('<Leader>lt', ':IndentLinesToggle<CR>')

nmap('<Leader>gv', ':Gvdiff<CR>')
nmap('<Leader>mv', ':Limelight<CR>')

-- Just press , + gd to disable gitgutter and ge to enable
nmap('<Leader>ggd', ':GitGutterDisable<CR>')
nmap('<Leader>gge', ':GitGutterEnable<CR>')
nmap('<Leader>r', '<C-r>')

-- Just press , + l to  nerdtree
nmap('<Leader>l', ':GitGutterLineHighlightsToggle<CR>')

-- Just press ,w to undo the last word in insert mode
-- Undo last character
imap('<Leader>h', '<C-h>')

-- Undo last word
imap('<Leader>ww', '<C-w>')

-- Undo last line
imap('<Leader>u', '<C-u>')

-- Undo everything untill last undo
imap('<Leader>u', '<C-o>u')

-- Navigation through splits and resize the current split
nmap('<Leader>hh', '<C-w>h')
nmap('<Leader>ll', '<C-w>l')
nmap('<Leader>jj', '<C-w>j')
nmap('<Leader>kk', '<C-w>k')
nmap('<Leader>H', '<C-w>H')
nmap('<Leader>L', '<C-w>L')
nmap('<Leader>J', '<C-w>J')
nmap('<Leader>K', '<C-w>K')
nmap('<Leader>w', '<C-w>')
nmap('<Leader>nl', ':set nolist<CR>')
nmap('<Leader>sl', ':set list<CR>')

-- navigate tabs
nmap('<Leader>tn', ':tabNext<CR>')
nmap('<Leader>tp', ':tabprevious<CR>')

-- navigating through lines should be easy, don't have to gj & gk anymore
--
noremap('k', 'gk')
noremap('gk', 'k')

noremap('j', 'gj')
noremap('gj', 'j')

-- Remove all trailing whitespace by pressing F5
-- nmap('<F5>', ':let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>')

-- The ' key just takes back to the mark's line, the `(backtick)
-- key takes you the exact position of the mark and i rarely
-- use the '(single quote) so i remap the backtick(`) to the
-- single quote key
noremap("'", "`")
noremap("`", "'")

-- Just ,p instead of ctrl + p
nmap('<Leader>p', ':GFiles<cr>')
nmap('<c-p>', ':Files<cr>')

-- Move back to normal mode from insert mode by typing ,]
imap('<Leader>[', '<Esc>')

-- Indents html on save and takes you to the top of the page
-- autocmd BufRead,BufWritePre *.html normal gg=G
-------------------------------------------------------------------'
-- map ctrl + c keys to autocomplete using emmet
-------------------------------------------------------------------'
imap('<Leader>c', '<c-y>,')
imap('<Leader>w', '<c-y>,')

-----------------------------------------------------------------'
-- Insert a hash rocket with <c-l> saves lots of time when writing ruby hashes, go channels etc
------------------------------------------------------------------'
imap('<c-l>', '<Space>=><Space>')
imap('<c-k>', '<Space>-><Space>')
imap('<c-j>', '<Space><-<Space>')

------------------------------------------------------------------'
--- Saves time; maps the spacebar to colon
------------------------------------------------------------------'

nmap('<Leader>bb', '<Esc>:Tabularize/= <CR>')
nmap('<Leader>tb', '<Esc>:Tabularize/')

-- Move to the next buffer
nmap('<Leader>l', ':bnext<CR>')
nmap('<Leader>tn', ':tabnext<CR>')
nmap('<Leader>tp', ':tabprevious<CR>')

-- Move to the previous buffer
nmap('<Leader>h', ':bprevious<CR>')

-- Move to the next buffer
nmap('<Leader>l', ':bNext<CR>')

nmap('<Leader>bf', ':bfirst<CR>')
nmap('<Leader>bf', ':Buffers<CR>')

-----------------------------------------------------------------'
-- Never have to lift your fingers just to escape insert mode ':''
-----------------------------------------------------------------'
imap('jk', '<Esc><Esc>')
imap('jj', '<Esc><Esc>')
imap('kk', '<Esc><Esc>')

-----------------------------------------------------------------'
-- sometimes you open a readonly file in vim but you forget to run vim with sudo
-- after making changes to it, thus you wont be able to save the file this is a trick to save it
-----------------------------------------------------------------'
-- cmap w!! w !sudo tee % >/dev/null

nmap('<Leader>rnf', ':call RenameFile()<CR>')

-----------------------------------------------------------------'
-- Vim Exchange settings
-----------------------------------------------------------------'
nmap('ex', '<Plug>(Exchange)')
vmap('ex', '<Plug>(Exchange)')

nmap('exc', '<Plug>(ExchangeClear)')
vmap('exc', '<Plug>(ExchangeClear)')

xmap('E', '<Plug>(Exchange)')

--move selected line /block of text in visual mode
xmap("K", ":move '<-2<cr>gv-gv")
xmap("J", ":move '>+1<cr>gv-gv")

nmap('exl', '<Plug>(ExchangeLine)')
vmap('exl', '<Plug>(ExchangeLine)')

-- coc configuration
vmap('<leader>f', '<Plug>(coc-format-selected)')
nmap('<leader>f', '<Plug>(coc-format-selected)')

-- No Arrow keys come on man!
nmap('<Left>', ':echo "no!"<CR>')
nmap('<Right>', ':echo "no!"<CR>')
nmap('<Up>', ':echo "no!"<CR>')
nmap('<Down>', ':echo "no!"<CR>')

nmap('<Leader>fn', ':FloatermNew<CR>')
nmap('<Leader>ft', ':FloatermToggle<CR>')

-- nnoremap <Leader>rg :Rg<C-W><CR>
nmap('<Leader>rg', ':Rg<CR>')

-- Ctags Mappings
nmap('<Leader>ff', ':tag<Space>')
-- type double dots followed by u to make word before cursor UPPERCASE

imap('<Leader>uu', '<Esc>bgUawA')

-- sorround non-quoted json keys with double quotes by pressing ,jx
nmap('<Leader>jx', ':%s/[ \\t]\\([A-Za-z_].*\\):/"\1":/<CR>')

-- sorround non-quoted json keys with double quotes by pressing ,s'
nmap('<Leader>js', ':%s/\\([A-Z_]*\\):/"\1":/<CR>')

--" LSP config (the mappings used in the default file don't quite work right)
noremap('<silent> gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
noremap('<silent> gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
noremap('<silent> gr', '<cmd>lua vim.lsp.buf.references()<CR>')
noremap('<silent> gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
noremap('<silent> K', '<cmd>lua vim.lsp.buf.hover()<CR>')
noremap('<silent> <C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
noremap('<silent> <C-n>', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
noremap('<silent> <C-p>', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')

vim.api.nvim_command([[
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)
]])

