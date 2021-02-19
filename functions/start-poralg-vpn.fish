function start-poralg-vpn --wraps='sudo openvpn --config /etc/openvpn/poralg.ovpn' --description 'alias start-poralg-vpn=sudo openvpn --config /etc/openvpn/poralg.ovpn'

echo > /etc/openvpn/credentials "\
$PORALG_USER
$PORALG_PASS$argv
"
sudo openvpn --config /etc/openvpn/poralg.ovpn;
end
