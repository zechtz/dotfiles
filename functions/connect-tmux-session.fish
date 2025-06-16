function connect-tmux-session --description 'Attach to an existing tmux session'
    if test (count $argv) -eq 0
        echo "Usage: connect-tmux-session <session-name>"
        return 1
    end

    cd /Volumes/Work/sites
    tmux attach-session -t $argv[1]
end
