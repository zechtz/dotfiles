function GetName()
  if vim.call("expand","%:t") =='' then return '<none>' else return vim.call("expand", "%:t") end
end

function GetCWD()
  return vim.call("expand", ":pwd")
end

function IsHelp()
  if vim.buftype=='help' then return vim.call('help') else return ':' end
end

function GetName()
  if vim.call("expand", "%:t") =='' then return '<none>' else return vim.call("expand", "%:t") end
end

vim.cmd([[
set statusline+=%2*%{&modified?'\[+]':''}%*
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
vim.g.airline_theme = 'onedark'
--vim.g.airline#extensions#tabline#enabled = 1
--vim.g.airline#extensions#tabline#fnamemod = ':t'
