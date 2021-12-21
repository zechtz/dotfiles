" Use CTRLP for c# fuzzy search
let python_highlight_all=1

" Set no max file limit
let g:ctrlp_max_files = 0
" Search with ctrl+p from current directory instead of project root
let g:ctrlp_working_path_mode = 0

"-----------------------------------------------------------------"
"Fuzzy search files with ctrl.p plugin
"-----------------------------------------------------------------"
set runtimepath^=~/.vim/bundle/ctrlp.vim
" check it here https://github.com/kien/ctrlp.vim

"-----------------------------------------------------------------"
" Make ctrl + p load 100% times faster, just tell it to ignore
" git files, node_modules and bower_components
"-----------------------------------------------------------------"
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

let g:ctrlp_custom_ignore = 'node_modules\|bower_compnents\|DS_Store\|git'

