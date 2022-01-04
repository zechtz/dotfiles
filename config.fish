fish_vi_key_bindings

set -gx HOME_DIR /home/$USER
set -gx JAVA_HOME /usr/bin
set -gx GOROOT /usr/local/go
set -gx GOPATH /data/go/src
set -gx CARGOPATH  /home/mtabe/.cargo
set -gx SCRIPTS /data/work/dotfiles/scripts
set -gx RUST_ANALYZER /home/mtabe/.local/share/nvim/lsp_servers/rust
set -gx DENO /home/mtabe/.local/share/nvim/lsp_servers/denols
set -gx CMAKE /home/mtabe/.local/share/nvim/lsp_servers/cmake/venv/bin
set -gx GOPLS /home/mtabe/.local/share/nvim/lsp_servers/go
set -gx ASDF /home/mtabe/.asdf/bin
set -gx CSS /home/mtabe/.local/share/nvim/lsp_servers/cssls/node_modules/.bin
set -gx ANGULARLS /home/mtabe/.local/share/nvim/lsp_servers/angularls/node_modules/.bin
set -gx DOCKERLS /home/mtabe/.local/share/nvim/lsp_servers/dockerfile/node_modules/.bin
set -gx DIAGNOSTICS /home/mtabe/.local/share/nvim/lsp_servers/diagnosticls/node_modules/.bin
set -gx DOTLS /home/mtabe/.local/share/nvim/lsp_servers/dotls/node_modules/.bin
set -gx CLANGLS /home/mtabe/.local/share/nvim/lsp_servers/clangd
set -gx YAMLS /home/mtabe/.local/share/nvim/lsp_servers/yaml/node_modules/.bin
set -gx GRAPHQLS /home/mtabe/.local/share/nvim/lsp_servers/graphql/node_modules/.bin
set -gx KOTLINLS /home/mtabe/.local/share/nvim/lsp_servers/kotlin/server/bin
set -gx VOLARLS /home/mtabe/.local/share/nvim/lsp_servers/volar/node_modules/.bin
set -gx VUELS /home/mtabe/.local/share/nvim/lsp_servers/vuels/node_modules/.bin
set -gx SQLLS /home/mtabe/.local/share/nvim/lsp_servers/sqlls/node_modules/.bin
set -gx SQLS /home/mtabe/.local/share/nvim/lsp_servers/sqls
set -gx EMMETLS /home/mtabe/.local/share/nvim/lsp_servers/emmet_ls/node_modules/.bin
set -gx LEMMINX /home/mtabe/.local/share/nvim/lsp_servers/lemminx
set -gx TAILWINDLS /home/mtabe/.local/share/nvim/lsp_servers/tailwindcss_npm/node_modules/.bin
set -gx ESLINTLS /home/mtabe/.local/share/nvim/lsp_servers/vscode-eslint/node_modules/.bin
set -gx SUMNEKO_LUALS /home/mtabe/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin

set -gx PATH /home/mtabe/.asdf/bin $CARGOPATH/bin $GOROOT/bin $SCRIPTS $RUST_ANALYZER $DENO $JAVA_HOME $ASDF $GOPLS $CMAKE $CSS $DOCKERLS $ANGULARLS $DIAGNOSTICS $DOTLS $CLANGLS $GRAPHQLS $YAMLS $KOTLINLS $VOLARLS $VUELS $SQLLS $SQLS $EMMETLS $LEMMINX $TAILWINDLS $ESLINTLS $SUMNEKO_LUALS $PATH

# source asdf at the bottom
source ~/.asdf/asdf.fish
