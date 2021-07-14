# Defined in - @ line 1
function mix-routes --wraps='mix phx.routes' --description 'alias mix-routes=mix phx.routes'
  mix phx.routes $argv;
end
