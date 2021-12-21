"-----------------------------------------------------------------"
" MULTI PURSOPSE TAB KEY
" Indent if we are at the begining of a line, else, do completion
"-----------------------------------------------------------------"
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<Tab>"
  endif
endfunction

"-----------------------------------------------------------------"
" Rename current file
"-----------------------------------------------------------------"
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'))
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction

function! GetCWD()
  return expand(":pwd")
endfunction

function! IsHelp()
  return &buftype=='help'?' (help) ':''
endfunction

function! GetName()
  return expand("%:t")==''?'<none>':expand("%:t")
endfunction

"-----------------------------------------------------------------"
" Make a directory if it doesn't exist
"-----------------------------------------------------------------"
function! s:MkNonExDir(file, buf)
  if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
    let dir=fnamemodify(a:file, ':h')
    if !isdirectory(dir)
      call mkdir(dir, 'p')
    endif
  endif
endfunction
augroup BWCCreateDir
  autocmd!
  autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

"-----------------------------------------------------------------"
" Resize the current split to at least (90,25) but no more than (140,60)
" or 2/3 of the available space otherwise.
"-----------------------------------------------------------------"
function! Splitresize()
  let hmax = max([winwidth(0), float2nr(&columns*0.66), 90])
  let vmax = max([winheight(0), float2nr(&lines*0.66), 25])
  exe "vertical resize" . (min([hmax, 140]))
  exe "resize" . (min([vmax, 60]))
endfunction

function! s:check_back_space() abort "" {{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction "" }}}
" end deoplete configuration

inoremap <silent> <CR> <C-r>=<SID>coc_confirm()<CR>
function! s:coc_confirm() abort
  if pumvisible()
    return coc#_select_confirm()
  else
    return "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
  endif
endfunction

