# Defined in - @ line 1
function start-rabbitmq --wraps='docker run -p 15672:15672 -d --hostname rabbitmq.local --name rabbitmq rabbitmq:3-management' --description 'alias start-rabbitmq=docker run -p 15672:15672 -d --hostname rabbitmq.local --name rabbitmq rabbitmq:3-management'
  docker run -p 15672:15672 -d --hostname rabbitmq.local --name rabbitmq rabbitmq:3-management $argv;
end
