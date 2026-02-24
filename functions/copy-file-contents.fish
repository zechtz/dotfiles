function copy-file-contents --description 'Copy the contents of a file to the clipboard'
    if test -f $argv[1]
        cat $argv[1] | pbcopy
        echo "Contents of $argv[1] copied to clipboard."
    else
        echo "Error: File '$argv[1]' not found."
    end
end
