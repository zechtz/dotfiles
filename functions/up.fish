# Defined in - @ line 1
function up --wraps='echo "Moving back one directory" && cd ..' --description 'alias up=echo "Moving back one directory" && cd ..'
  echo "Moving back one directory" && cd .. $argv;
end
