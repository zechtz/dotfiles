# Defined in - @ line 1
function l --wraps='ls -CF' --description 'alias l=ls -CF'
  ls -CF $argv;
end
