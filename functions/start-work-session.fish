# Defined in - @ line 1
function start-work-session --wraps='cd /data/sites && tmux new -s work' --description 'alias start-work-session=cd /data/sites && tmux new -s work'
  cd /data/sites && tmux new -s work $argv;
end
