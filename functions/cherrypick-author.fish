function cherrypick-author
    if test -n "$argv[1]"
        # Get the list of commit hashes for the author
        set commits (git log --oneline --author="$argv[1]" | awk '{print $1}')
        if test -n "$commits"
            echo "Cherry-picking commits by $argv[1]:"
            for commit in $commits
                echo "Cherry-picking $commit..."
                git cherry-pick $commit
                if test $status -ne 0
                    echo "Conflict detected in $commit. Please resolve conflicts and continue."
                    return 1
                end
            end
            echo "All commits cherry-picked successfully."
        else
            echo "No commits found for author: $argv[1]"
        end
    else
        echo "Error: Please provide an author name."
    end
end
