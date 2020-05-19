[ -n "$PS1" ] && source ~/.bash_profile;
export PATH=$HOME/local/bin:$PATH

#export NVM_DIR="/home/mtabe/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

source /home/mtabe/.phpbrew/bashrc
export PHPBREW_SET_PROMPT=0
export PHPBREW_RC_ENABLE=0

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export NVM_DIR="$HOME/.nvm"
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export ECLIPSE_HOME="/home/mtabe/eclipse/java-2019-06/eclipse"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/mtabe/.sdkman"
[[ -s "/home/mtabe/.sdkman/bin/sdkman-init.sh" ]] && source "/home/mtabe/.sdkman/bin/sdkman-init.sh"
# bind 'set completion-ignore-case on'
# Disable Ruby constanct warnings e.g warning: constant ::NIL is deprecated
export RUBYOPT="-W0"
