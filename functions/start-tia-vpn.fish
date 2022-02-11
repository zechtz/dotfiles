# Defined in - @ line 1
function start-tia-vpn --wraps='sudo openvpn --config /etc/openvpn/tia.ovpn' --description 'alias start-tia-vpn=sudo openvpn --config /etc/openvpn/tia.ovpn'
  sudo openvpn --config /etc/openvpn/tia.ovpn $argv;
end
