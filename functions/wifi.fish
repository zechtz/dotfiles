# Defined in - @ line 1
function wifi --wraps=/etc/NetworkManager/system-connections --description 'alias wifi=/etc/NetworkManager/system-connections'
  /etc/NetworkManager/system-connections  $argv;
end
