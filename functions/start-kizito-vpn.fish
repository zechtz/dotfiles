# Defined in - @ line 1
function start-kizito-vpn --wraps='sudo openvpn --config /etc/openvpn/kizito.ovpn' --description 'alias start-kizitot-vpn=sudo openvpn --config /etc/openvpn/kizito.ovpn'
    sudo openvpn --config /etc/openvpn/kizito.ovpn $argv
end
