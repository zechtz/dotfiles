function mygitlog-reverse
    set author (test -n "$argv[1]" && echo $argv[1] || git config user.name)
    # Get the list of commit hashes for the author in reverse order
    set commits (git log --oneline --author="$author" --reverse | awk '{print $1}')
    if test -n "$commits"
        echo "Commits by $author (oldest first):"
        for commit in $commits
            echo $commit
        end
    else
        echo "No commits found for author: $author"
    end
end
