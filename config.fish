source ~/.asdf/asdf.fish

set -gx JAVA_HOME /usr/bin
set -gx GOROOT /usr/local/go
set -gx GOPATH /data/go/src
set -gx CARGOPATH  /home/mtabe/.cargo
set -gx SCRIPTS /data/work/dotfiles/scripts
set -gx ASDF /home/mtabe/.asdf/bin

set -gx PATH /home/mtabe/.asdf/bin $CARGOPATH/bin $GOROOT/bin $SCRIPTS $JAVA_HOME $ASDF $PATH
