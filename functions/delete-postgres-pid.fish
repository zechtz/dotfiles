function delete-postgres-pid --wraps="test -f /opt/homebrew/var/postgresql@17/postmaster.pid && rm /opt/homebrew/var/postgresql@17/postmaster.pid && echo 'PostgreSQL PID file deleted' || echo 'No PID file found'"
    set pid_file /opt/homebrew/var/postgresql@17/postmaster.pid
    if test -f $pid_file
        rm $pid_file
        echo "PostgreSQL PID file deleted"
    else
        echo "No PID file found"
    end
end
