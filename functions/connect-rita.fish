# Defined in - @ line 1
function connect-rita --description 'alias connect-rita=openconnect with config ~/.openconnect_rita.conf'
    set config_file ~/.openconnect_rita.conf
    set log_file ~/.openconnect_rita.log

    if not test -f "$config_file"
        echo "Error: Config file $config_file not found"
        return 1
    end

    set server (grep '^server=' $config_file | cut -d'=' -f2)
    set protocol (grep '^protocol=' $config_file | cut -d'=' -f2)
    set username (grep '^username=' $config_file | cut -d'=' -f2)
    set certificate (grep '^certificate=' $config_file | cut -d'=' -f2)
    set background (grep '^background=' $config_file | cut -d'=' -f2)

    set cmd "openconnect --protocol=$protocol --user=$username --verbose"
    if test -n "$certificate"
        set cmd "$cmd --certificate=$certificate"
    end
    if test "$background" = true
        set cmd "$cmd -b --syslog"
    end
    set cmd "$cmd $server"

    echo "Connecting to rita ($server)... Logging to $log_file and system log"
    # Ensure log file exists and is writable
    touch $log_file
    chmod 666 $log_file
    # Run openconnect with sudo and redirect output in a subshell
    sudo fish -c "$cmd >> $log_file 2>&1"
end
