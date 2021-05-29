" set up prettier
let g:prettier#autoformat = 1
let g:prettier#exec_cmd_async = 1
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()

autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript

