# Defined in - @ line 1
function copy-text --wraps='xclip=xclip -i -sel c -f | xclip -i -sel p' --description alias\ copy-text=xclip=\'xclip\ -i\ -sel\ c\ -f\ \|\ xclip\ -i\ -sel\ p\'
  xclip=xclip -i -sel c -f | xclip -i -sel p  $argv;
end
