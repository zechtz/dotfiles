vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Search', timeout = 200})
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
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

augroup vimrcEx
  autocmd!
  autocmd FileType text setlocal textwidth=78
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
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

  autocmd! FileType mkd setlocal syn=off

  autocmd! CmdwinEnter * :unmap <cr>
  autocmd! CmdwinLeave * :call MapCR()

  autocmd! BufNewFile,BufRead *.md setlocal ft=

  autocmd! FileType *.slim set sw=2 sts=2 et
augroup end
]]
