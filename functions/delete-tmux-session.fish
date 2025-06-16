function delete-tmux-session --description 'Delete a tmux session by name'
    if test (count $argv) -eq 0
        echo "Usage: delete-tmux-session <session-name>"
        return 1
    end
    tmux kill-session -t $argv[1]
end
