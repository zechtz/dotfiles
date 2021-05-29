"syntax
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'elixir-lang/vim-elixir'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'
Plug 'Quramy/tsuquyomi'
Plug 'othree/yajs.vim'
Plug 'othree/jsdoc-syntax.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'elzr/vim-json'
Plug 'valloric/MatchTagAlways'
Plug 'moll/vim-node'
Plug 'vim-scripts/c.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'digitaltoad/vim-pug'
Plug 'lambdatoast/elm.vim'
Plug 'StanAngeloff/php.vim'
Plug 'slashmili/alchemist.vim'
"Plug 'dansomething/vim-eclim'
Plug 'maxmellon/vim-jsx-pretty'
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
" nginx systax Highlight
Plug 'chr4/nginx.vim'
Plug 'leafOfTree/vim-vue-plugin'
