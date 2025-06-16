function start-tmux-session --description 'Start a tmux session with a given name'
    if test (count $argv) -eq 0
        echo "Usage: start-tmux-session <session-name>"
        return 1
    end

    if set -q TMUX
        echo "Already inside a tmux session. Exit first or use: env TMUX= start-tmux-session <name>"
        return 1
    end

    cd /Volumes/Work/sites && tmux new -s $argv[1]
end
