function mygitlogs
    if test -n "$argv[1]"
        git log --oneline --author="$argv[1]"
    else
        git log --oneline --author=(git config user.name)
    end
end
