function generate-migration --wraps='gradle migration -Pn' --wraps='gradle migration -Pn=' --description 'alias generate-migration=gradle migration -Pn='
  gradle migration -Pn=$argv; 
end
