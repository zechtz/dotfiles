function stopgeoserver
    set user (whoami)
    if test (systemctl is-active geoserver) = inactive
        echo "GeoServer is not running."
    else
        echo "Stopping GeoServer as user: $user"
        sudo systemctl stop geoserver
        if test (systemctl is-active geoserver) = inactive
            echo "GeoServer stopped successfully."
        else
            echo "Failed to stop GeoServer."
        end
    end
end
