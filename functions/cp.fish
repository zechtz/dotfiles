# Defined in - @ line 1
function cp --wraps='rsync -ah --progress' --description 'alias cp=rsync -ah --progress'
  rsync -ah --progress $argv;
end
