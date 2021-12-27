source ~/.asdf/asdf.fish

set -gx JAVA_HOME /usr/bin
set -gx GOROOT /usr/local/go
set -gx GOPATH /data/go/src
set -gx CARGOPATH  /home/mtabe/.cargo

set -gx PATH /home/mtabe/.asdf/bin $CARGOPATH/bin $GOROOT/bin $PATH
