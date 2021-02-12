# Defined in - @ line 1
function gp --wraps='git push' --description 'alias gp=git push'
  git push $argv;
end
