-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- This file is automatically loaded by lazyvim.config.init

M = {}
local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- helper functions
local function mmap(mode, shortcut, command)
  keymap(mode, shortcut, command, opts)
end

local function nmap(shortcut, command)
  mmap("n", shortcut, command)
end

local function imap(shortcut, command_or_mappings, mappings)
  if type(command_or_mappings) == "table" then
    mappings = command_or_mappings
    local filetype = vim.bo.filetype
    local arrow = mappings[filetype] or "=>"
    mmap("i", shortcut, arrow)
  else
    mmap("i", shortcut, command_or_mappings)
  end
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
  mmap("v", shortcut, command)
end

local function xmap(shortcut, command)
  mmap("x", shortcut, command)
end

local function noremap(shortcut, command)
  keymap("n", shortcut, command, { noremap = true, silent = true })
end

-- Remap space as leader key
keymap("n", "<Space>", "", opts)

-- Set the emmet leader key to '<C-Z>'
--[[ vim.api.nvim_set_keymap("n", "<C-y>", "<Plug>(emmet-expand-abbr)", { silent = true })
vim.api.nvim_set_keymap("v", "<C-y>", "<Plug>(emmet-expand-abbr)", { silent = true }) ]]

-- Delete LazyVim default keymaps
vim.keymap.del("n", "<C-k>")
vim.keymap.del("n", "<C-j>")
vim.keymap.del("n", "<leader>l")
vim.keymap.del("n", "<leader>fT")

local t = {}
t["<c-k>"] = { "scroll", { "-vim.wo.scroll", "true", "250" } }
t["<c-j>"] = { "scroll", { "vim.wo.scroll", "true", "250" } }

require("neoscroll.config").set_mappings(t)

nmap("<Space>", "<cmd>WhichKey \\<leader><cr>")
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

--chKey
--Resize with arrows
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
nmap("<C-z>", "<cmd>ZenMode<cr>")
nmap("<c-n>", ":e ~/Notes/<cr>")

nmap("-", ":lua require'lir.float'.toggle()<cr>")
nmap("gx", [[:silent execute '!$BROWSER ' . shellescape(expand('<cfile>'), 1)<CR>]])

vmap("//", [[y/\V<C-R>=escape(@",'/\')<CR><CR>]])
nmap("<m-v>", "<cmd>lua require('lsp_lines').toggle()<cr>")

nmap("K", ":lua require('config.keymaps').show_documentation()<CR>")
nmap("<m-/>", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>")
xmap("<m-/>", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')
nmap(
  "<s-tab>",
  "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal'})<cr>"
)
nmap("<m-g>", "<cmd>Telescope git_branches<cr>")
nmap("<s-enter>", "<cmd>TodoQuickFix<cr>")

vim.cmd([[
  function! QuickFixToggle()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
      copen
    else
      cclose
    endif
  endfunction
]])

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

-- Open the current file in the default program
nmap("<Leader>x", ":!xdg-open %<CR><CR>")

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
imap(",,b", "<Esc>^i") -- move to the begining of the line in insert mode and enter insert mode
imap(",,e", "<Esc>A") -- move to the end of the line in insert mode and enter insert mode

nmap("<Leader>gl", "<cmd>lua vim.diagnostic.open_float()<CR>")

-- Indents html on save and takes you to the top of the page
vim.cmd([[
autocmd BufRead,BufWritePre *.html normal gg=G
autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()
autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
]])

-------------------------------------------------------------------'
-- map ctrl + c keys to autocomplete using emmet
-------------------------------------------------------------------'
imap(",c", "<c-y>,")
vmap(",w", "<c-y>,")

-----------------------------------------------------------------'
-- Insert a hash rocket with <c-l> saves lots of time when writing ruby hashes, go channels, elixir & rust pattern matching etc
------------------------------------------------------------------'
---
local arrow_mappings = {
  javascript = "<Space>=><Space>",
  ruby = "<Space>=><Space>",
  rust = "<Space>-><Space>",
  go = "<Space>-><Space>",
  elixir = "<Space>-><Space>",
}

imap("<c-j>", "<Space><-<Space>")
imap("<c-l>", arrow_mappings)

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

-- Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
--  See https://github.com/hrsh7th/vim-vsnip/pull/50

vnoremap("//", [[y/\V<C-R>=escape(@",'/\')<CR><CR>]])
noremap(
  "<C-p>",
  "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>"
)
noremap("<C-t>", "<cmd>lua vim.lsp.buf.document_symbol()<cr>")
noremap("<C-\\>", "<cmd>vsplit<cr>")

return M
