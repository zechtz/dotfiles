# Defined in - @ line 1
function start-mnrt-vpn --wraps='sudo openvpn --config /etc/openvpn/mnrt.ovpn' --description 'alias start-mnrt-vpn=sudo openvpn --config /etc/openvpn/mnrt.ovpn'
  sudo openvpn --config /etc/openvpn/mnrt.ovpn $argv;
end
