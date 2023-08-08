fish_vi_key_bindings

set -g theme_color_scheme wombat
set -g theme_nerd_fonts yes

set -gx HOME_DIR /home/$USER
set -gx GOGH /data/work/Gogh/gogh
set -gx ANDROID_HOME /home/mtabe/Android/Sdk
set -gx ANDROID_HOME_TOOLS /usr/lib/android-sdk/cmdline-tools/latest/tools/bin
set -gx ANDROID_STUDIO /data/work/android-studio/bin
set -gx PIP_BIN /home/mtabe/.asdf/installs/python/3.10.0/bin
set -gx JAVA_HOME /home/mtabe/.asdf/installs/java/openjdk-11
set -gx DART_HOME /usr/bin/dart/bin
set -gx FLUTTER_PATH /data/work/flutter/flutter/bin
set -gx DART_PACKAGES_PATH /home/mtabe/.pub-cache/bin
set -gx PYTHON_LIBS /home/mtabe/.local/bin
set -gx RUBY_CONFIGURE_OPTS "--with-openssl-dir=/opt/openssl-1.1.1n"
set -gx GRADLE_HOME /usr/bin/gradle
set -gx GOROOT /home/mtabe/.asdf/installs/golang/1.18.8/go
set -gx LUA_FORMATTER_BIN /home/mtabe/.asdf/installs/lua/5.4.4/luarocks/bin
set -gx GOPATH /data/go/src
set -gx CARGOPATH /home/mtabe/.cargo
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
set -gx EMMETLS /home/mtabe/.local/share/nvim/lsp_servers/emmet_ls/node_modules/.bin
set -gx LEMMINX /home/mtabe/.local/share/nvim/lsp_servers/lemminx
set -gx TAILWINDLS /home/mtabe/.local/share/nvim/lsp_servers/tailwindcss_npm/node_modules/.bin
set -gx ESLINTLS /home/mtabe/.local/share/nvim/lsp_servers/vscode-eslint/node_modules/.bin
set -gx ELIXIRLS /home/mtabe/.local/share/nvim/lsp_servers/elixir/elixir-ls
set -gx SUMNEKO_LUALS /home/mtabe/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin
set -gx PHPCS /home/mtabe/.config/composer/vendor/squizlabs/php_codesniffer/bin
set -gx COMPOSER_BIN /home/mtabe/.config/composer/vendor/bin
set -gx MISSPELL /home/mtabe/misc/bin
set -gx PHPCSFIXER /home/mtabe/misc/vendor/bin
set -gx KNEX /home/mtabe/misc/knex/node_modules/.bin
set -gx ESCRIPTS /home/mtabe/.asdf/installs/elixir/1.13.2/.mix/escripts
set -gx SQLLS /home/mtabe/.config/yarn/global/node_modules/.bin
set -gx SPRING_HOME /home/mtabe/.asdf/installs/spring-boot/2.6.4
set -gx DENO_INSTALL /home/mtabe/.deno
set -gx TERMINAL gnome-terminal
set -gx PRG_USER zachariah.ngonyani
set -gx PRG_PASSWORD Ng@m1@0022!

set -gx PATH /home/mtabe/.asdf/bin \
    $CARGOPATH/bin \
    $GOROOT/bin \
    $SCRIPTS \
    $RUST_ANALYZER \
    $DENO \
    $JAVA_HOME\bin \
    $ASDF \
    $GOPLS \
    $CMAKE \
    $CSS \
    $DOCKERLS \
    $ANGULARLS \
    $DIAGNOSTICS \
    $DOTLS \
    $CLANGLS \
    $GRAPHQLS \
    $YAMLS \
    $KOTLINLS \
    $VOLARLS \
    $VUELS \
    $EMMETLS \
    $LEMMINX \
    $TAILWINDLS \
    $ESLINTLS \
    $ELIXIRLS \
    $SUMNEKO_LUALS \
    $PATH \
    $PHPCS \
    $MISSPELL \
    $PHPCSFIXER \
    $KNEX \
    $ESCRIPTS \
    $SQLLS \
    # $RUBY_GEM_PATH \
    $GOPATH/bin \
    $SPRING_HOME/bin \
    $LUA_FORMATTER_BIN \
    $DENO_INSTALL/bin \
    $PIP_BIN \
    $GOGH \
    $GRADLE_HOME/bin \
    $PYTHON_LIBS \
    $COMPOSER_BIN \
    $DART_HOME \
    $FLUTTER_PATH \
    $ANDROID_HOME \
    $ANDROID_HOME_TOOLS \
    $ANDROID_STUDIO \
    $DART_PACKAGES_PATH
# source asdf at the bottom
source ~/.asdf/asdf.fish

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# pnpm
set -gx PNPM_HOME "/home/mtabe/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
