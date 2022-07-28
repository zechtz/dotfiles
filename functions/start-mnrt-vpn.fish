# Defined in - @ line 1
function start-mnrt-vpn --wraps='sudo openvpn --config /etc/openvpn/mnrt_portal.ovpn' --description 'alias start-mnrt-vpn=sudo openvpn --config /etc/openvpn/mnrt_portal.ovpn'
  sudo openvpn --config /etc/openvpn/mnrt_portal.ovpn $argv;
end
