grep "^set superusers" /boot/grub/grub.cfg
#set superusers="<username>"
grep "^password" /boot/grub/grub.cfg
# password_pbkdf2 <username> <encrypted-password>