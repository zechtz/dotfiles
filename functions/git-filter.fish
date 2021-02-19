# Defined in - @ line 1
function git-filter --wraps='git filter-branch --tree-filter' --description 'alias git-filter=git filter-branch --tree-filter'
  git filter-branch --tree-filter 'rm -rf $argv' HEAD;
end
