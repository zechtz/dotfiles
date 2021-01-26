# Defined in - @ line 1
function fetch --wraps='git fetch' --description 'alias fetch=git fetch'
  git fetch $argv;
end
