function copy-ssh-key --wraps='cat ~/.ssh/id_ed25519.pub | xclip -selection clipboard' --description 'alias copy-ssh-key cat ~/.ssh/id_ed25519.pub | xclip -selection clipboard'
    cat ~/.ssh/id_ed25519.pub | pbcopy -selection clipboard $argv

end
