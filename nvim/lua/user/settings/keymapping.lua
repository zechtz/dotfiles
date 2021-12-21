local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap , as leader key
vim.g.mapleader = ","
vim.g.maplocalleader = ","
keymap("", ",", "<Nop>", opts)

-- helper functions
local function map(mode, shortcut, command)
  opts = {}
  vim.api.nvim_set_keymap(mode, shortcut, command, opts)
end

local function nmap(shortcut, command)
  map('n', shortcut, command)
end

local function imap(shortcut, command)
  map('i', shortcut, command)
end

local function snoremap(shortcut, command)
  opts = {noremap = true, silent = true, expr = true}
  keymap('s', shortcut, command, opts)
end

local function inoremap(shortcut, command)
  opts = {noremap = true, silent = true, expr = true}
  keymap('i', shortcut, command, opts)
end

local function cnoremap(shortcut, command)
  opts = {noremap = true, expr = true}
  keymap('c', shortcut, command, opts)
end

local function vnoremap(shortcut, command)
  opts = {noremap = true, expr = true}
  keymap('v', shortcut, command, opts)
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

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- navigation through splits and resize the current split
nmap('<Space>hh', '<C-w>h')
nmap('<Space>ll', '<C-w>l')
nmap('<Space>jj', '<C-w>j')
nmap('<Space>kk', '<C-w>k')
nmap('<Space>H', '<C-w>H')
nmap('<Space>L', '<C-w>L')
nmap('<Space>J', '<C-w>J')
nmap('<Space>K', '<C-w>K')
nmap('<Space>w', '<C-w>')

nmap('<Leader>s', ':NERDTreeToggle<CR>')
nmap('<Leader><Space', ':noh<CR>')

-- Open the current file in the default program
nmap('<Leader>x', ':!xdg-open %<CR><CR>')

nmap('<Space>', ':')
vmap('<Space>', '<Esc>')

-- Allow gf to open non-existent file
nmap('gf', ':edit <cfile><CR>')

--leader ++  => encrement number under cursor, leader xx  => decrement number
nmap('<Leader>++', '<c-a>')
nmap('<Leader>aa', '<c-a>')
nmap('<Leader>xx', '<c-x>')
nmap('<Leader>dd', '<c-x>')
nmap('<Leader>ff', '<c-x><c-f>')

nmap(',//', 'gcc')
vmap(',//', 'gc')
nmap(',cc', 'gcc')
vmap(',cc', 'gc')

nmap('<Leader>aa', '<c-x><c-o>')
nmap('<Leader>gss', '<C-j>a')

-- Map ctrl+H to Leader HH for Vertical & Horizontal splits
nmap('<Leader>HH', '<C-w>H')
nmap('<Leader>LL', '<C-w>L')

nmap('<Leader>tr', ':TroubleToggle<CR>')

-- Map ctrl+H to Leader HH for Vertical & Horizontal splits
nmap('<Leader>WW', '<C-w>K')
nmap('<Leader>WW', '<C-w>J')

-- navigating through lines should be easy, don't have to gj & gk anymore
noremap('k', 'gk')
noremap('gk', 'k')

noremap('j', 'gj')
noremap('gj', 'j')

-- The ' key just takes back to the mark's line, the `(backtick)
-- key takes you the exact position of the mark and i rarely
-- use the '(single quote) so i remap the backtick(`) to the
-- single quote key
noremap("'", "`")
noremap("`", "'")

-- Move back to normal mode from insert mode by typing ,]
imap('<Leader>[', '<Esc>')

-- Indents html on save and takes you to the top of the page
vim.cmd([[
autocmd BufRead,BufWritePre *.html normal gg=G
autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()
autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
]])

-------------------------------------------------------------------'
-- map ctrl + c keys to autocomplete using emmet
-------------------------------------------------------------------'
imap('<Leader>c', '<c-y>')
vmap('<Leader>w', '<c-y>')

-----------------------------------------------------------------'
-- Insert a hash rocket with <c-l> saves lots of time when writing ruby hashes, go channels etc
------------------------------------------------------------------'
imap('<c-l>', '<Space>=><Space>')
imap('<c-k>', '<Space>-><Space>')
imap('<c-j>', '<Space><-<Space>')

nmap('<Leader>bb', '<Esc>:Tabularize/= <CR>')
nmap('<Leader>tb', '<Esc>:Tabularize/')

-----------------------------------------------------------------'
-- Never have to lift your fingers just to escape insert mode ':''
-----------------------------------------------------------------'
imap('jk', '<Esc><Esc>')
imap('jj', '<Esc><Esc>')
imap('kk', '<Esc><Esc>')

--move selected line /block of text in visual mode
xmap("K", ":move '<-2<cr>gv-gv")
xmap("J", ":move '>+1<cr>gv-gv")

-- No Arrow keys come on man!
nmap('<Left>', ':echo "no!"<CR>')
nmap('<Right>', ':echo "no!"<CR>')
nmap('<Up>', ':echo "no!"<CR>')
nmap('<Down>', ':echo "no!"<CR>')

-- nnoremap <Leader>rg :Rg<C-W><CR>
nmap('<Leader>rg', ':Rg<CR>')

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
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()
autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript
]])

-- " NOTE: You can use other key to expand snippet.
cnoremap("<C-j>", 'pumvisible() ? "\\<C-n>" : "\\<C-j>"')
cnoremap("<C-k>", 'pumvisible() ? "\\<C-p>" : "\\<C-k>"')

-- Expand
inoremap('<C-z>', 'vsnip#expandable() ? "<Plug>(vsnip-expand)" : "<C-j>"')
snoremap('<C-j>', 'vsnip#expandable() ? "<Plug>(vsnip-expand)" : "<C-j>"')

-- Expand or jump
inoremap('<C-n>',  'vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-l>"')
snoremap('<C-l>',  'vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-l>"')

--  Jump forward or backward
inoremap('<Tab>', 'vsnip#jumpable(1) ? "<Plug>(vsnip-jump-next)" : "<Tab>"')
snoremap('<Tab>',  'vsnip#jumpable(1) ? "<Plug>(vsnip-jump-next)"  : "<Tab>"')
inoremap('<S-Tab>',  'vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<S-Tab>"')
snoremap('<S-Tab>' , 'vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<S-Tab>"')

-- Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
--  See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap('s', '<Plug>(vsnip-select-text)')
xmap('s',  '<Plug>(vsnip-select-text)')
nmap('S',  '<Plug>(vsnip-cut-text)')
xmap('S',  '<Plug>(vsnip-cut-text)')

vnoremap("//", [[y/\V<C-R>=escape(@",'/\')<CR><CR>]])
noremap("<C-p>", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>")
noremap("<C-t>", "<cmd>lua vim.lsp.buf.document_symbol()<cr>")
noremap("<C-\\>", "<cmd>vsplit<cr>")
