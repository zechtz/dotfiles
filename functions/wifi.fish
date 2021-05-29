# Defined in - @ line 1
function wifi --wraps=/etc/NetworkManager/system-connections --wraps='cd /etc/NetworkManager/system-connections' --description 'alias wifi=cd /etc/NetworkManager/system-connections'
  cd /etc/NetworkManager/system-connections $argv;
end
