function copy-ssh-key --wraps='cat ~/.ssh/id_rsa.pub | xclip -selection clipboard' --description 'alias copy-ssh-key cat ~/.ssh/id_rsa.pub | xclip -selection clipboard'
  cat ~/.ssh/id_rsa.pub | xclip -selection clipboard $argv; 
end
