function unmount-ext4-drive --description "Unmount ext4 disk"
    if test (count $argv) -ne 1
        echo "Usage: unmount-ext4-drive <diskname>"
        echo "Example: unmount-ext4-drive disk7s1"
        return 1
    end

    set diskname $argv[1]
    set mount_point "$HOME/mnt_$diskname"

    if mount | grep -q $mount_point
        echo "Unmounting $mount_point"
        sudo umount $mount_point
        if test $status -eq 0
            echo "✅ Successfully unmounted $diskname"
        else
            echo "❌ Failed to unmount $diskname"
        end
    else
        echo "❌ $diskname is not mounted at $mount_point"
    end
end
