findmnt --kernel /tmp
# TARGET SOURCE FSTYPE OPTIONS
# /tmp tmpfs tmpfs rw,nosuid,nodev,noexec,inode6

systemctl is-enabled tmp.mount
# enabled