# Defined in - @ line 1
function ll --wraps=eza --description 'alias ll=eza -la --icons'
  eza -la --icons $argv;
end
