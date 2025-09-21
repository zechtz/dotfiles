function list-ext4-mounts --description "List mounted ext4 drives"
    echo "Mounted ext4 drives:"
    mount | grep "$HOME/mnt_disk" | while read line
        echo "📁 $line"
    end
end
