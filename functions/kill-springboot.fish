function kill-springboot
    if test (count $argv) -gt 0
        set port $argv[1]
        set pid (lsof -ti tcp:$port)
        if test -n "$pid"
            echo "Killing Spring Boot process on port $port (PID: $pid)"
            kill -9 $pid
        else
            echo "No process found on port $port"
        end
    else
        set pids (lsof -iTCP -sTCP:LISTEN -P | grep java | grep ':88' | awk '{print $2}' | sort -u)
        if test -n "$pids"
            echo "Killing Spring Boot processes on ports starting with 88xx:"
            for pid in $pids
                echo " - Killing PID $pid"
                kill -9 $pid
            end
        else
            echo "No Spring Boot processes found on ports starting with 88xx"
        end
    end
end
