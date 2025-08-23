# Defined in - @ line 1
function start-redis --wraps='docker run -p 6379:6379 -d --hostname redis.local --name redis-client -e REDIS_PASSWORD=mypassword redis:latest' --description 'alias start-redis=docker run -p 6379:6379 -d --hostname redis.local --name redis-client -e REDIS_PASSWORD=mypassword redis:latest'
    docker run -p 6379:6379 -d --hostname redis.local --name redis-client -e REDIS_PASSWORD=mypassword redis:latest $argv
end
