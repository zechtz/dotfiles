# Defined in - @ line 1

function start-ppra-vpn --wraps='sudo openvpn --config /opt/homebrew/etc/openvpn/ppra.ovpn' --description 'Start PPRA VPN connection'
    sudo /opt/homebrew/sbin/openvpn --config /opt/homebrew/etc/openvpn/ppra.ovpn $argv
end
