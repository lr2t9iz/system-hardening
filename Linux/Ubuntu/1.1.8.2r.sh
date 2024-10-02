# modify /etc/fstab
vim /etc/fstab 

# -> tmpfs /dev/shm tmpfs defaults,rw,nosuid,nodev,noexec,relatime 0 0
mount -o remount /dev/shm