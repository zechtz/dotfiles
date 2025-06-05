# Defined in - @ line 1
function disconnect-rita --description 'alias disconnect-rita=sudo killall openconnect'
    echo "Disconnecting rita VPN..."
    sudo killall openconnect
end
