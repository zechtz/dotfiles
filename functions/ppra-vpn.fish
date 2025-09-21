function ppra-vpn --description 'Manage PPRA VPN connection (start, stop, status)'
    set vpn_config "/opt/homebrew/etc/openvpn/ppra.ovpn"
    set pid_file "/tmp/ppra-vpn.pid"

    switch $argv[1]
        case start
            # Check if VPN is already running
            if test -f $pid_file
                set pid (cat $pid_file)
                if ps -p $pid >/dev/null
                    echo "VPN is already running with PID $pid"
                    return 1
                else
                    # Clean up stale PID file
                    rm -f $pid_file
                end
            end

            # Start VPN in the background
            echo "Starting PPRA VPN..."
            sudo /opt/homebrew/sbin/openvpn --config $vpn_config --daemon --writepid $pid_file
            if test $status -eq 0
                echo "VPN started successfully. PID saved in $pid_file"
            else
                echo "Failed to start VPN"
                return 1
            end

        case stop
            # Stop the VPN
            if test -f $pid_file
                set pid (cat $pid_file)
                if ps -p $pid >/dev/null
                    echo "Stopping VPN (PID: $pid)..."
                    sudo kill $pid
                    if test $status -eq 0
                        rm -f $pid_file
                        echo "VPN stopped successfully"
                    else
                        echo "Failed to stop VPN"
                        return 1
                    end
                else
                    echo "No running VPN process found. Cleaning up stale PID file."
                    rm -f $pid_file
                end
            else
                echo "VPN is not running (no PID file found)"
            end

        case status
            # Check VPN status
            if test -f $pid_file
                set pid (cat $pid_file)
                if ps -p $pid >/dev/null
                    echo "VPN is running with PID $pid"
                else
                    echo "VPN is not running (stale PID file found)"
                    rm -f $pid_file
                end
            else
                echo "VPN is not running"
            end

        case '*'
            echo "Usage: ppra-vpn [start|stop|status]"
            return 1
    end
end
