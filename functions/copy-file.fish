# Defined in - @ line 1
function copy-file --wraps='xclip -sel clip <' --description 'alias copy-file=xclip -sel clip <'
  xclip -sel clip < $argv;
end
