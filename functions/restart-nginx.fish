function restart-nginx
    set log_file ~/.nginx-restart.log
    set timestamp (date "+%Y-%m-%d %H:%M:%S")

    echo "[$timestamp] Restarting nginx via Homebrew services..." | tee -a $log_file

    brew services stop nginx
    rm -f ~/Library/LaunchAgents/homebrew.mxcl.nginx.plist
    launchctl bootout gui/(id -u) ~/Library/LaunchAgents/homebrew.mxcl.nginx.plist 2>/dev/null
    brew services start nginx

    # Give nginx a moment to start
    sleep 1

    # Try common PID file locations
    set pid ""
    for pidfile in \
        /usr/local/var/run/nginx.pid \
        /opt/homebrew/var/run/nginx.pid
        if test -f $pidfile
            set pid (cat $pidfile)
            break
        end
    end

    # Fallback: pgrep
    if test -z "$pid"
        set pid (pgrep -o nginx)
    end

    if test -n "$pid"
        echo "[$timestamp] nginx running with PID: $pid" | tee -a $log_file
    else
        echo "[$timestamp] nginx started but PID not found" | tee -a $log_file
    end

    echo "[$timestamp] nginx restart complete." | tee -a $log_file
end
