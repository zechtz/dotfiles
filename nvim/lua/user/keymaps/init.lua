M = {}
local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- helper functions
local function map(mode, shortcut, command)
  opts = {}
  keymap(mode, shortcut, command, opts)
end

local function nmap(shortcut, command)
  map("n", shortcut, command)
end

local function imap(shortcut, command)
  map("i", shortcut, command)
end

local function snoremap(shortcut, command)
  opts = { noremap = true, silent = true, expr = true }
  keymap("s", shortcut, command, opts)
end

local function inoremap(shortcut, command)
  opts = { noremap = true, silent = true, expr = true }
  keymap("i", shortcut, command, opts)
end

local function cnoremap(shortcut, command)
  opts = { noremap = true, expr = true }
  keymap("c", shortcut, command, opts)
end

local function vnoremap(shortcut, command)
  opts = { noremap = true, expr = true }
  keymap("v", shortcut, command, opts)
end

local function vmap(shortcut, command)
  map("v", shortcut, command)
end

local function xmap(shortcut, command)
  map("x", shortcut, command)
end

local function noremap(shortcut, command)
  keymap("n", shortcut, command, { noremap = true, silent = true })
end

-- Remap space as leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
nmap("<C-Space>", "<cmd>WhichKey \\<leader><cr>")
nmap("<C-i>", "<C-i>")

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
nmap("<m-h>", "<C-w>h")
nmap("<m-j>", "<C-w>j")
nmap("<m-k>", "<C-w>k")
nmap("<m-l>", "<C-w>l")
nmap("<m-tab>", "<c-6>")

-- Tabs --
nmap("<m-t>", ":tabnew %<cr>")
nmap("<m-y>", ":tabclose<cr>")
nmap("<m-\\>", ":tabonly<cr>")

-- Resize with arrows
nmap("<C-Up>", ":resize -2<CR>")
nmap("<C-Down>", ":resize +2<CR>")
nmap("<C-Left>", ":vertical resize -2<CR>")
nmap("<C-Right>", ":vertical resize +2<CR>")

-- Stay in indent mode
vmap("<", "<gv")
vmap(">", ">gv")

-- Move text up and down
vmap("p", '"_dP')

-- Custom
-- keymap("n", "<c-h>", "<cmd>nohlsearch<cr>", opts)
-- NOTE: the fact that tab and ctrl-i are the same is stupid
-- keymap("n", "<TAB>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
nmap("Q", "<cmd>Bdelete!<CR>")
nmap("<F1>", ":e ~/Notes/<cr>")
nmap("<F3>", ":e .<cr>")
nmap("<F4>", "<cmd>Telescope resume<cr>")
nmap("<F5>", "<cmd>Telescope commands<CR>")
keymap(
  "n",
  "<F6>",
  [[:echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>]],
  opts
)
nmap("<F7>", "<cmd>TSHighlightCapturesUnderCursor<cr>")
nmap("<F8>", "<cmd>TSPlaygroundToggle<cr>")
nmap("<F11>", "<cmd>lua vim.lsp.buf.references()<CR>")
nmap("<F12>", "<cmd>lua vim.lsp.buf.definition()<CR>")
nmap("<C-p>", "<cmd>Telescope projects<cr>")
nmap("<C-t>", "<cmd>lua vim.lsp.buf.document_symbol()<cr>")
-- nmap("<C-s>", "<cmd>vsplit<cr>")
nmap("<C-z>", "<cmd>ZenMode<cr>")
nmap("<c-n>", ":e ~/Notes/<cr>")

nmap("-", ":lua require'lir.float'.toggle()<cr>")
nmap("gx", [[:silent execute '!$BROWSER ' . shellescape(expand('<cfile>'), 1)<CR>]])

vmap("//", [[y/\V<C-R>=escape(@",'/\')<CR><CR>]])
-- Change '<CR>' to whatever shortcut you like :)
-- vim.api.nvim_set_keymap("n", "<CR>", "<cmd>NeoZoomToggle<CR>", { noremap = true, silent = true, nowait = true })
-- keymap("n", "===", "<cmd>JABSOpen<cr>", {noremap = true, silent = true, nowait = true})

-- alt binds
-- keymap("n", "<m-s>", "<cmd>split<cr>", opts)
nmap("<m-v>", "<cmd>lua require('lsp_lines').toggle()<cr>")
-- keymap("n", "<m-q>", "<cmd>:q<cr>", opts)

M.show_documentation = function()
  local filetype = vim.bo.filetype
  if vim.tbl_contains({ "vim", "help" }, filetype) then
    vim.cmd("h " .. vim.fn.expand "<cword>")
  elseif vim.tbl_contains({ "man" }, filetype) then
    vim.cmd("Man " .. vim.fn.expand "<cword>")
  elseif vim.fn.expand "%:t" == "Cargo.toml" then
    require("crates").show_popup()
  else
    vim.lsp.buf.hover()
  end
end

nmap("K", ":lua require('user.keymaps').show_documentation()<CR>")
nmap("<m-/>", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>")
xmap("<m-/>", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')
nmap(
  "<tab>",
  "<cmd>lua require('telescope').extensions.harpoon.marks(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal', prompt_title='Harpoon'})<cr>"
)
nmap(
  "<s-tab>",
  "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal'})<cr>"
)
-- vim.api.nvim_set_keymap("n", "<tab>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
nmap("<m-g>", "<cmd>Telescope git_branches<cr>")
nmap("<s-enter>", "<cmd>TodoQuickFix<cr>")

-- l = { "<cmd>lua require('user.bfs').open()<cr>", "Buffers" },

vim.cmd [[
  function! QuickFixToggle()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
      copen
    else
      cclose
    endif
  endfunction
]]

nmap("<m-q>", ":call QuickFixToggle()<cr>")
nmap("<c-l>", "<cmd>lua vim.lsp.codelens.run()<cr>")

nmap("<Space>hh", "<C-w>h")
nmap("<Space>ll", "<C-w>l")
nmap("<Space>jj", "<C-w>j")
nmap("<Space>kk", "<C-w>k")
nmap("<Space>H", "<C-w>H")
nmap("<Space>L", "<C-w>L")
nmap("<Space>J", "<C-w>J")
nmap("<Space>K", "<C-w>K")
nmap("<Space>w", "<C-w>")

nmap("<Leader>s", ":NERDTreeToggle<CR>")
nmap("<Leader><Space", ":noh<CR>")

-- Open the current file in the default program
nmap("<Leader>x", ":!xdg-open %<CR><CR>")

nmap("<Space><Space>", ":")
vmap("<Space>", "<Esc>")

-- Allow gf to open non-existent file
nmap("gf", ":edit <cfile><CR>")

-- leader ++  => encrement number under cursor, leader xx  => decrement number
nmap("<Leader>++", "<c-a>")
nmap("<Leader>aa", "<c-a>")
nmap("<Leader>xx", "<c-x>")
nmap("<Leader>dd", "<c-x>")
nmap("<Leader>ff", "<c-x><c-f>")

nmap(",//", "gcc")
vmap(",//", "gc")
nmap(",cc", "gcc")
vmap(",cc", "gc")

nmap("<Leader>aa", "<c-x><c-o>")
nmap("<Leader>gss", "<C-j>a")

-- Map ctrl+H to Leader HH for Vertical & Horizontal splits
nmap("<Leader>HH", "<C-w>H")
nmap("<Leader>LL", "<C-w>L")

nmap("<Leader>tr", ":TroubleToggle<CR>")

-- Map ctrl+H to Leader HH for Vertical & Horizontal splits
nmap("<Leader>WW", "<C-w>K")
nmap("<Leader>WW", "<C-w>J")

-- navigating through lines should be easy, don't have to gj & gk anymore
noremap("k", "gk")
noremap("gk", "k")
noremap("j", "gj")
noremap("gj", "j")

-- enter vim hardmode disables hjkl navigation break the bad habbits
noremap("hh", "<NOP>")
noremap("jj", "<NOP>")
noremap("kk", "<NOP>")
noremap("ll", "<NOP>")

-- The ' key just takes back to the mark's line, the `(backtick)
-- key takes you the exact position of the mark and i rarely
-- use the '(single quote) so i remap the backtick(`) to the
-- single quote key
noremap("'", "`")
noremap("`", "'")

-- Move back to normal mode from insert mode by typing ,]
imap("<Leader>[", "<Esc>")

-- Indents html on save and takes you to the top of the page
vim.cmd [[
autocmd BufRead,BufWritePre *.html normal gg=G
autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()
autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
]]

-------------------------------------------------------------------'
-- map ctrl + c keys to autocomplete using emmet
-------------------------------------------------------------------'
imap(",c", "<c-y>,")
vmap(",w", "<c-y>,")

-----------------------------------------------------------------'
-- Insert a hash rocket with <c-l> saves lots of time when writing ruby hashes, go channels etc
------------------------------------------------------------------'
imap("<c-j>", "<Space><-<Space>")
imap("<c-k>", "<Space>-><Space>")
imap("<c-l>", "<Space>=><Space>")

nmap("<Leader>bt", "<Esc>:Tabularize/= <CR>")
nmap("<Leader>tb", "<Esc>:Tabularize/")

-----------------------------------------------------------------'
-- Never have to lift your fingers just to escape insert mode ':''
-----------------------------------------------------------------'
imap("jk", "<Esc><Esc>")
imap("jj", "<Esc><Esc>")
imap("kk", "<Esc><Esc>")

-- move selected line /block of text in visual mode
xmap("K", ":move '<-2<cr>gv-gv")
xmap("J", ":move '>+1<cr>gv-gv")

-- No Arrow keys come on man!
nmap("<Left>", ':echo "no!"<CR>')
nmap("<Right>", ':echo "no!"<CR>')
nmap("<Up>", ':echo "no!"<CR>')
nmap("<Down>", ':echo "no!"<CR>')
nmap("<Leader>rnf", "<cmd>lua require('user.helpers.helpers').RenameFile()<cr>")

-- nnoremap <Leader>rg :Rg<C-W><CR>
nmap("<Leader>rg", ":Rg<CR>")

-- type double dots followed by u to make word before cursor UPPERCASE
imap("<Leader>uu", "<Esc>bgUawA")

-- sorround non-quoted json keys with double quotes by pressing ,jx
nmap("<Leader>jx", ':%s/[ \\t]\\([A-Za-z_].*\\):/"\1":/<CR>')

-- sorround non-quoted json keys with double quotes by pressing ,s'
nmap("<Leader>js", ':%s/\\([A-Z_]*\\):/"\1":/<CR>')

-- " LSP config (the mappings used in the default file don't quite work right)
noremap("<silent> gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
noremap("<silent> gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
noremap("<silent> gr", "<cmd>lua vim.lsp.buf.references()<CR>")
noremap("<silent> gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
noremap("<silent> K", "<cmd>lua vim.lsp.buf.hover()<CR>")
noremap("<silent> <C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
noremap("<silent> <C-n>", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
noremap("<silent> <C-p>", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")

vim.api.nvim_command [[
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()
autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript
]]

-- " NOTE: You can use other key to expand snippet.
cnoremap("<C-j>", 'pumvisible() ? "\\<C-n>" : "\\<C-j>"')
cnoremap("<C-k>", 'pumvisible() ? "\\<C-p>" : "\\<C-k>"')

-- Expand
inoremap("<C-z>", 'vsnip#expandable() ? "<Plug>(vsnip-expand)" : "<C-j>"')
snoremap("<C-j>", 'vsnip#expandable() ? "<Plug>(vsnip-expand)" : "<C-j>"')

-- Expand or jump
inoremap("<C-n>", 'vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-l>"')
snoremap("<C-l>", 'vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-l>"')

--  Jump forward or backward
inoremap("<Tab>", 'vsnip#jumpable(1) ? "<Plug>(vsnip-jump-next)" : "<Tab>"')
snoremap("<Tab>", 'vsnip#jumpable(1) ? "<Plug>(vsnip-jump-next)"  : "<Tab>"')
inoremap("<S-Tab>", 'vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<S-Tab>"')
snoremap("<S-Tab>", 'vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<S-Tab>"')

-- Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
--  See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap("s", "<Plug>(vsnip-select-text)")
xmap("s", "<Plug>(vsnip-select-text)")
nmap("S", "<Plug>(vsnip-cut-text)")
xmap("S", "<Plug>(vsnip-cut-text)")

vnoremap("//", [[y/\V<C-R>=escape(@",'/\')<CR><CR>]])
noremap(
  "<C-p>",
  "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>"
)
noremap("<C-t>", "<cmd>lua vim.lsp.buf.document_symbol()<cr>")
noremap("<C-\\>", "<cmd>vsplit<cr>")

return M
