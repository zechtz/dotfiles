# Defined in - @ line 1
function week --wraps='date +%V' --description 'alias week=date +%V'
  date +%V $argv;
end
