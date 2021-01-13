function prompt_git -d "Write out the right prompt"
    set -l last_status $status # Special variable for storing last `$status` returned by terminal.
    set -l is_git_repository (git rev-parse --is-inside-work-tree ^/dev/null) # Special variable indicating git.
    # ==============
    # Status Segment
    # ==============
    # This segment is not visible in the prompt by default. It checks the `$last_status` variable to see if the
    # terminal's last executed command or function returned an error status. If it did then the status segment is
    # generated based on the returned status code, formatted and colored accordingly, and printed to prompt.
    # --------------
    if not test $last_status -eq 0 # Test if `$last_status` is not equal to `0`.
        set_color -o red # Color the prompt bold red.
        # Eventually it would be cool to include conditional programming here to generate unique output for any
        # error cases to print to the prompt. For now, I'm just going to have this segment print a generic
        # formatted string to the prompt in the event of any errors.
        printf "%b" "\U203C Error Code $last_status \U203C"
        set_color normal
    end
    # ===========
    # Git Segment
    # ===========
    # An optional segment that is generated and printed to the prompt if the PWD is a git repository. If the
    # segment is generated it displays a variety of indicators and information depending on the current state of
    # repo.
    # -----------
    if test -n "$is_git_repository" # Test if the PWD is an active git repository.
        set_color A3A3A3 # Color the prompt grey. (Uses a hex color.)
        echo -n " on  " # Echo the git repo indicator.
        set -l branch (git symbolic-ref --short HEAD ^/dev/null; or git show-ref --head -s --abbrev | head -n1 ^/dev/null)
        set -l has_unstaged_files (git status --porcelain |grep "??" | wc -l)
        set_color red # Color the prompt red.
        echo -n "$branch " # Echo the git branch into the prompt.
        # git status --porcelain 2>/dev/null| grep "^??" | wc -l; or set -l has_unstaged_files
        # git diff-files --quiet --ignore-submodules ^/dev/null; or set -l has_unstaged_files
        git diff-index --quiet --ignore-submodules --cached HEAD ^/dev/null; or set -l has_staged_files

        if set -l has_unstaged_files (git status --porcelain |grep "??" | wc -l) > 0  # Check if the repo is unstaged.
            set_color red # Color the prompt red.
            #echo -n "[x]"
        else if set -l has_unstaged_files (git status --porcelain |grep "M" | wc -l) > 0  # Check if the repo is staged.
            set_color yellow # Color the prompt yellow.
            #echo -n "[✓]"
        else # If the repo is clean then proceed.
            set_color green # Color the prompt green.
            #echo -n "[✓]"
        end

        #git rev-parse --abbrev-ref '@{upstream}' >/dev/null &>1; and set -l has_upstream # Set `$has_upstream`.

        if set -q has_upstream # Check if the repository has any upstream.
            set -l commit_counts (git rev-list --left-right --count 'HEAD...@{upstream}' ^/dev/null) # Commit counts.
            set -l commits_to_push (echo $commit_counts | cut -f 1 ^/dev/null) # Commits to push.
            set -l commits_to_pull (echo $commit_counts | cut -f 2 ^/dev/null) # Commits to pull.
            if test $commits_to_push != 0 # Check if there any commits to push.
                if test $commits_to_pull -ne 0 # Check if there are any commits to pull.
                    set_color red # Color the prompt red.
                else if test $commits_to_push -gt 3 # Check if there are more than 3 commits to push.
                    set_color yellow # Color the prompt yellow.
                else # If there are no commits to pull, and no more than 3 commits to push, then proceed.
                    set_color green # Color the prompt green.
                end
                echo -n " ⇡ " # Echo the upstream push symbol.
            end
            if test $commits_to_pull != 0 # Check if there are any commits to pull.
                if test $commits_to_push -ne 0 # Check if there are any commits to push
                    set_color red # Color the prompt red.
                else if test $commits_to_pull -gt 3 # Check if there are more than 3 commits to pull.
                    set_color yellow # Color the prompt yellow.
                else # If no commits to push, and no more than 3 commits to pull, then proceed.
                    set_color green # Color the prompt green.
                end
                echo -n " ⇣ " # Echo the upstream pull symbol.
            end
            set_color normal # Reset color and text decoration.
        end
        if test (git stash list | wc -l) -gt 0 # Check if there are any stashed changes.
            set_color A3A3A3 # Color the prompt grey. (Uses a hex color.)
            echo -n " ☰ " # Echo the stacked changes symbol.
        end
        set_color normal # Reset color and text decoration.
    end
    # -------------------------------------------------------------------------------------------------------------
    # That's all there is to right side secondary prompt. All other prompt segments can be found in the fish
    # function file for the primary prompt: `fish_prompt.fish`.
    # -------------------------------------------------------------------------------------------------------------
end
