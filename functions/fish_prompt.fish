set fish_git_dirty_color red
set fish_git_not_dirty_color green

function parse_git_branch
  set -l branch (git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/')
  set -l git_status (git status -s)

  if test -n "$git_status"
    echo (set_color $fish_git_dirty_color) $branch(set_color normal)
  else
    echo (set_color $fish_git_not_dirty_color) $branch(set_color normal)
  end
end

function fish_prompt
    set -l git_branch (git branch 2>/dev/null | sed -n '/\* /s// on branch  /p')

    set_color red
    printf '%s' $USER
    set_color normal

    set_color magenta
    set_color normal
    printf ' in '

    set_color $fish_color_cwd
    set fish_prompt_pwd_dir_length 10
    set_color magenta

    set -l git_dir (git rev-parse --git-dir 2> /dev/null)
    if test -n "$git_dir"
      printf '%s%s %s%s%s%s' (set_color $fish_color_cwd) (pwd) (set_color normal) (set_color A3A3A3)'on ' (parse_git_branch)
    else
      printf '%s%s %s%s%s'  (set_color $fish_color_cwd) (pwd) (set_color normal)
    end
    echo
    printf '↪ '
  end
