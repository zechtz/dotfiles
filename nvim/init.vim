"------------------------------------------------------------
" Maintained by: Zachariah Ngonyani
" zach@watabelabs.com
" @mtabetz
" http://watabelabs.com
"------------------------------------------------------------
source /data/work/dotfiles/nvim/general/functions.vim
source /data/work/dotfiles/nvim/general/editor-settings.vim
source /data/work/dotfiles/nvim/keys/mappings.vim

source /data/work/dotfiles/nvim/plugins/plugin-config/vimgo.vim
source /data/work/dotfiles/nvim/plugins/plugin-config/vim-ale.vim
source /data/work/dotfiles/nvim/plugins/plugin-config/airline.vim
source /data/work/dotfiles/nvim/plugins/plugin-config/gitgutter.vim
source /data/work/dotfiles/nvim/plugins/plugin-config/surround.vim
source /data/work/dotfiles/nvim/plugins/plugin-config/ctrlp.vim
source /data/work/dotfiles/nvim/plugins/plugin-config/syntastic.vim
source /data/work/dotfiles/nvim/plugins/plugin-config/vimjsx.vim
source /data/work/dotfiles/nvim/plugins/plugin-config/ultisnips.vim
source /data/work/dotfiles/nvim/plugins/plugin-config/prettier.vim
source /data/work/dotfiles/nvim/plugins/plugin-config/vim-elixir.vim
source /data/work/dotfiles/nvim/plugins/plugin-config/vim-rails.vim
source /data/work/dotfiles/nvim/plugins/plugin-config/javacomplete.vim
source /data/work/dotfiles/nvim/plugins/plugin-config/duoplete.vim
source /data/work/dotfiles/nvim/plugins/plugin-config/coc.vim
source /data/work/dotfiles/nvim/plugins/plugin-config/coc-prettier.vim
source /data/work/dotfiles/nvim/plugins/plugin-config/endwise.vim
"source /data/work/dotfiles/nvim/plugins/plugin-config/youcompleteme.vim

source /data/work/dotfiles/nvim/general/javascript.vim
source /data/work/dotfiles/nvim/general/python.vim
source /data/work/dotfiles/nvim/general/typescript.vim
source /data/work/dotfiles/nvim/general/markdown.vim

" Add any plugin before plug#end() and run :PlugInstall
call plug#begin('~/.config/nvim/plugged')

source /data/work/dotfiles/nvim/plugins/colorscheme.vim
source /data/work/dotfiles/nvim/plugins/utils.vim
source /data/work/dotfiles/nvim/plugins/syntax.vim
" Add plugins to &runtimepath
call plug#end()

source /data/work/dotfiles/nvim/themes/colors/onehalfdark.vim
source /data/work/dotfiles/nvim/themes/dark.vim

source /data/work/dotfiles/nvim/general/extras.vim
