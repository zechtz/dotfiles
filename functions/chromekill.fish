# Defined in - @ line 1
function chromekill --wraps=ps\ ux\ \|\ grep\ \'\[C\]hrome\ Helper\ --type=renderer\'\ \|\ grep\ -v\ extension-process\ \|\ tr\ -s\ \'\ \'\ \|\ cut\ -d\ \'\ \'\ -f2\ \|\ xargs\ kill --description alias\ chromekill=ps\ ux\ \|\ grep\ \'\[C\]hrome\ Helper\ --type=renderer\'\ \|\ grep\ -v\ extension-process\ \|\ tr\ -s\ \'\ \'\ \|\ cut\ -d\ \'\ \'\ -f2\ \|\ xargs\ kill
  ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill $argv;
end
