function mount-ext4-drive --description "Mount ext4 disk using ext4fuse"
    # Check if diskname argument is provided
    if test (count $argv) -ne 1
        echo "Usage: mount-ext4-drive <diskname>"
        echo "Example: mount-ext4-drive disk7s1"
        return 1
    end

    set diskname $argv[1]
    set device_path "/dev/$diskname"
    set ext4fuse_path /Volumes/Work/work/ext4-mac/ext4fuse/ext4fuse
    set mount_point "$HOME/mnt_$diskname"

    # Check if ext4fuse exists
    if not test -f $ext4fuse_path
        echo "Error: ext4fuse not found at $ext4fuse_path"
        echo "Make sure you've built ext4fuse in that directory"
        return 1
    end

    # Check if device exists
    if not test -e $device_path
        echo "Error: Device $device_path not found"
        echo "Available disks:"
        diskutil list | grep -E "disk[0-9]"
        return 1
    end

    # Create mount point if it doesn't exist
    if not test -d $mount_point
        echo "Creating mount point: $mount_point"
        mkdir -p $mount_point
    end

    # Check if something is already mounted there
    if mount | grep -q $mount_point
        echo "Unmounting existing mount at $mount_point"
        sudo umount $mount_point
    end

    echo "Mounting $device_path to $mount_point (read-only)"
    echo "Using: $ext4fuse_path"

    # Mount the device (read-only for safety)
    sudo $ext4fuse_path $device_path $mount_point -o allow_other,ro

    if test $status -eq 0
        echo "✅ Successfully mounted $diskname"
        echo "📁 Mount point: $mount_point"
        echo "🔍 To browse: open $mount_point"
        echo "🚫 To unmount: sudo umount $mount_point"
    else
        echo "❌ Failed to mount $diskname"
        return 1
    end
end
