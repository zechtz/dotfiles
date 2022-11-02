vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo,spectre_panel nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
    autocmd CmdWinEnter * quit
  augroup end
  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end
  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end
  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end
  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end
  augroup sourcing
    autocmd!
    autocmd BufWritePost init.lua source %
  augroup END

  augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.java FormatWrite
  augroup END

  augroup _lsp
    autocmd!
    autocmd BufWritePre *.go,*.rs,*.ex,*.exs,*.rb,*.ts,*.tsx,*.jsx,*.js,*.lua,*.vue,*.css,*.scss,*.sass,*.html,*.py,*.elixir lua vim.lsp.buf.format { async = true }
  augroup end

  augroup nvimEx
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
  augroup END
]]
