let g:ale_fixers = {
      \'vue': ['remove_trailing_lines', 'trim_whitespace'],
      \'javascript': ['prettier'],
      \'typescript': ['prettier'],
      \'json': ['prettier'],
      \'php': ['prettier'],
      \}

let g:ale_fix_on_save = 1
let g:rustfmt_on_save = 1
let g:ale_linter_aliases = {'vue': ['javascript','typescript', 'html', 'scss']}

let g:ale_fixers = {
      \ 'javascript': ['eslint']
      \ }

" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1

