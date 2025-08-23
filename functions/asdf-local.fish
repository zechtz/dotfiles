function asdf-local
    if test (count $argv) -lt 2
        echo "Usage: asdf local <name> <version>"
        return 1
    end
    asdf set $argv
end
