systemctl unmask tmp.mount
# For specific configuration requirements of the /tmp mount for your environment, 
# modify /etc/fstab or tmp.mount.
# Example of /etc/fstab configured tmpfs file system with specific mount options:
tmpfs /tmp tmpfs defaults,rw,nosuid,nodev,noexec,relatime,size=2G 0 0
# Example of tmp.mount configured tmpfs file system with specific mount options: 
# /etc/systemd/system/tmp.mount
#-------------------------
[Unit]
Description=Temporary Directory /tmp
ConditionPathIsSymbolicLink=!/tmp
DefaultDependencies=no
Conflicts=umount.target
Before=local-fs.target umount.target
After=swap.target

[Mount] 
What=tmpfs
Where=/tmp 
Type=tmpfs
#-------------------------

mount -o remount /tmp