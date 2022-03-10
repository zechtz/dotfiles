USER = vim.fn.expand("$USER")
local undo_dir_path = "/home/" .. USER .. "/.config/nvim/undo" -- /home/mtabe/.config/nvim

local options = {
	backup = false, -- creates a backup file
	clipboard = "unnamedplus", -- allows neovim to access the system clipboard
	cmdheight = 2, -- more space in the neovim command line for displaying messages
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp
	conceallevel = 0, -- so that `` is visible in markdown files
	fileencoding = "utf-8", -- the encoding written to a file
	hlsearch = true, -- highlight all matches on previous search pattern
	ignorecase = true, -- ignore case in search patterns
	mouse = "a", -- allow the mouse to be used in neovim
	pumheight = 10, -- pop up menu height
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	showtabline = 0, -- always hide tabs
	smartcase = true, -- smart case
	smartindent = true, -- make indenting smarter again
	incsearch = true, -- incremental search
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	swapfile = false, -- creates a swapfile
	termguicolors = true, -- set term gui colors (most terminals support this)
	timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true, -- enable persistent undo
	updatetime = 300, -- faster completion (4000ms default)
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	expandtab = true, -- convert tabs to spaces
	shiftwidth = 2, -- the number of spaces inserted for each indentation
	tabstop = 2, -- insert 2 spaces for a tab
	cursorline = true, -- highlight the current line
	number = true, -- set numbered lines
	relativenumber = true, -- set relative numbered lines
	numberwidth = 4, -- set number column width to 2 {default 4}
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	wrap = false, -- display lines as one long line
	scrolloff = 8, -- is one of my fav
	sidescrolloff = 8,
	encoding = "utf-8",
	shell = "/bin/fish", -- set shell option to fish shell
	autowriteall = true, -- automatically save the edited but not saved file  when switching buffers
	exrc = true, -- allow for project specific vimrc
	lazyredraw = true, -- Makes scrolling faster
	wildmenu = true, -- Enhance command-line completion (displays all matching files when we tab complete)
	undolevels = 10000, -- How many undos
	undoreload = 10000, -- number of lines to save for undo
	undodir = undo_dir_path, -- where to save undo history
	backupskip = "/tmp/*,/private/tmp/*", -- Don’t create backups when editing files in certain directories
	softtabstop = 2,
	autoindent = true,
	wildignorecase = true,
	re = 0,
	-- guifont = "Fira\\ Code:h12",
	guifont = "JetBrainsMono\\ Mono\\ Nerd\\ Font\\ Medium\\ 12",
	foldmethod = "marker",
	wildoptions = "pum",
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd([[
  set showtabline=0
]])

vim.lsp.set_log_level("debug")

vim.g.codefmt = 1
vim.g.codefmt_google_java_executable = "java -jar /data/work/java-formatter/google-java-format-1.13.0-all-deps.jar"

vim.g.elm_format_autosave = 1
vim.g.airline_powerline_fonts = 1
-- vim.g.airline#extensions#tabline#enabled = 1
-- "editor.fontLigatures": true,
