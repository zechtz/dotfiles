# Defined in - @ line 1
function mix-generate-migration --wraps='mix ecto.gen.migration' --description 'alias mix-generate-migration=mix ecto.gen.migration'
  mix ecto.gen.migration $argv;
end
