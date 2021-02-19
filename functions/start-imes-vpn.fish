# Defined in - @ line 1
function start-imes-vpn --wraps='sudo openvpn --config /etc/openvpn/imes.ovpn' --description 'alias start-imes-vpn=sudo openvpn --config /etc/openvpn/imes.ovpn'
  sudo openvpn --config /etc/openvpn/imes.ovpn $argv;
end
