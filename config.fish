#export PATH="$HOME/bin:$PATH";
#export PATH="$HOME/usr/bin:$PATH";

# set the go path
set -x GOROOT /usr/local/go

# set the workspace path
set -x GOPATH /data/go

set -x GOBIN /data/go/bin

# add the go bin path to be able to execute our programs
set -x PATH $PATH /usr/local/go/bin $GOPATH/bin
