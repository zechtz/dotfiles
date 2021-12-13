function! GetName()
  return vim.call("expand","%:t")=='' ? '<none>' : vim.call("expand", "%:t")
end

function! GetCWD()
  return vim.call("expand", ":pwd")
end

function! IsHelp()
  return &buftype=='help'?' (help) ':''
end

function! GetName()
  return vim.call("expand", "%:t")==''?'<none>': vim.call("expand", "%:t")
end

vim.cmd([[
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

set laststatus=2

]])

vim.g.airline_powerline_fonts = 1
vim.g.airline_theme='onedark'
vim.g.airline#extensions#tabline#enabled = 1
vim.g.airline#extensions#tabline#fnamemod = ':t'
