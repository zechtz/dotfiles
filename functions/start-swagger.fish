# Defined in - @ line 1
function start-swagger --wraps='docker run -p 3000:8080 swaggerapi/swagger-editor' --description 'alias start-swagger=docker run -p 3000:8080 swaggerapi/swagger-editor'
  docker run -p 3000:8080 swaggerapi/swagger-editor $argv;
end
