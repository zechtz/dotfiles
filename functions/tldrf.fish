function tldrf --wraps='tldr --list | fzf --preview "tldr {1} --color=always" --preview-window=right,70% | xargs tldr' --description 'alias tldrf tldr --list | fzf --preview "tldr {1} --color=always" --preview-window=right,70% | xargs tldr'
    tldr --list | fzf --preview "tldr {1} --color=always" --preview-window=right,70% | xargs tldr $argv
end
