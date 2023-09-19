# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/usr/bin:$PATH"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2>/dev/null
done

# Add tab completion for many Bash commands
if which brew >/dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
	source "$(brew --prefix)/share/bash-completion/bash_completion"
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion
fi

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &>/dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
	complete -o default -o nospace -F _git g
fi

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# what using the cp command, please show progress in human readable format and maintain
# permissions -a = premissions, -h in human readable
alias cp="rsync -ah --progress"

# sometimes the habits from using windows just wont leave so make cls alias to clear
alias cls='clear'
alias CLS='clear'
alias CLEAR='clear'
alias CD='cd'

# if i just type up take me back one level up
alias up='echo "Moving back one directory" && cd ..'

# if i type home just bring me back to home/root folder
alias home='echo "Welcome, you are in your home folder now" && cd ~'
export PATH="$PATH:/home/mtabe/jasperstarter/bin"
export PATH="$PATH:/home/mtabe/.composer/vendor/bin"
#export PATH="$PATH:/home/mtabe/mongodb/bin"

export PATH="$PATH:/usr/local/elixir/bin"

export GOROOT=/usr/local/go
export GOPATH="/data/go"
export PATH="$GOPATH/bin:$GOROOT/bin:$PATH"

eval "$(SHELL=/home/mtabe/.dir_colors/dircolors)"

export PATH="$HOME/.cargo/bin:$PATH"

export DISK2="/data"

# avoid duplicates..
export HISTCONTROL=ignoredups:erasedups

# append history entries..
shopt -s histappend

# After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

export SPRING_HOME=/opt/spring-boot/spring-1.4.0.RELEASE
export PATH=$SPRING_HOME/bin:$PATH

export PATH="/data/kubernetes/third_party/etcd:${PATH}"

vipsql() {
	vim -c 'setlocal buftype=nofile | setlocal ft=sql | VipsqlOpenSession '"$*"
}

# Let root user use same vim configurations as normal user
sudo() {
	if [[ $1 == "vim" ]] || [[ $1 == "nvim" ]]; then
		command sudo -E nvim "${@:2}"
	else
		command sudo "$@"
	fi
}

export PATH="$HOME/.exenv/bin:$PATH"
# eval "$(exenv init -)"
