# Defined in - @ line 1
function start-mongo --wraps='docker run -p 27017:27017 -d --hostname mongo.local --name mongo_db mongo:4.0.4' --description 'alias start-mongo=docker run -p 27017:27017 -d --hostname mongo.local --name mongo_db mongo:4.0.4'
  docker run -p 27017:27017 -d --hostname mongo.local --name mongo_db mongo:4.0.4 $argv;
end
