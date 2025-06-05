function asdf-global
    if test (count $argv) -lt 2
        echo "Usage: asdf global <name> <version>"
        return 1
    end
    asdf set -u $argv
end
