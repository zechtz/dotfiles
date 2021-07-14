# Defined in - @ line 1
function mix-gen-json --wraps='mix phx.gen.json' --description 'alias mix-gen-json=mix phx.gen.json'
  mix phx.gen.json $argv;
end
