function startgeoserver
    set user (whoami)
    if test (systemctl is-active geoserver) = active
        echo "GeoServer is already running."
    else
        echo "Starting GeoServer as user: $user"
        sudo systemctl start geoserver
        if test (systemctl is-active geoserver) = active
            echo "GeoServer started successfully."
        else
            echo "Failed to start GeoServer."
        end
    end
end
