# Defined in - @ line 1
function gp --wraps='git push origin master' --description 'alias gp=git push origin master'
  git push origin master $argv;
end
