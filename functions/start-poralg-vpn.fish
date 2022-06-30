function start-poralg-vpn --wraps='sudo openvpn --auth-nocache --config /etc/openvpn/poralg.ovpn' --description 'alias start-poralg-vpn=sudo openvpn --config /etc/openvpn/poralg.ovpn'

echo > /etc/openvpn/credentials/poralg "\
$PRG_USER
$PRG_PASSWORD$argv
"
sudo openvpn --auth-nocache --config /etc/openvpn/poralg.ovpn;
end
