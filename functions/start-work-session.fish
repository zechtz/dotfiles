# Defined in - @ line 1
function start-work-session --wraps='cd /Volumes/Work/sites && tmux new -s work' --description 'alias start-work-session=cd /Volumes/Work/sites && tmux new -s work'
    cd /Volumes/Work/sites && tmux new -s work $argv

end
