#!/usr/bin/env fish

function kill-port
    if test (count $argv) -eq 0
        echo "Usage: kill-port <port>"
        return 1
    end

    set port $argv[1]

    # Get PIDs of processes listening on the port and kill them
    set pids (lsof -iTCP:$port -sTCP:LISTEN -P | awk 'NR>1 {print $2}' | sort -u)

    if test -z "$pids"
        echo "No process found listening on port $port"
    else
        echo "Killing process(es) on port $port: $pids"
        echo $pids | xargs kill -9
    end
end
