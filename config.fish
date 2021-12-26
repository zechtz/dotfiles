source ~/.asdf/asdf.fish

set -x JAVA_HOME /usr/bin
set -gx GOROOT /usr/local/go
set -gx GOPATH /data/go/src

set -gx PATH /home/mtabe/.asdf/bin  $GOROOT/bin $PATH
