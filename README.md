# reboot_menu
Reboot to any os installed from linux system.

Add the functions to .bashrc and then you can reboot to any os listed in the menu with the use of ```$ reboot-to ``` command.

```
$  reboot-to 
[sudo] password for userxyz: 
0  - Ubuntu
1  - Windows Boot Manager (on /dev/sda1)
2  - Windows Boot Manager (on /dev/sdb1)
3  - System setup

Please enter which os to reboot: 1
```

Inspired by:
 - http://askubuntu.com/questions/18170/how-to-reboot-into-windows-from-ubuntu
 - https://unix.stackexchange.com/questions/43196/how-can-i-tell-grub-i-want-to-reboot-into-windows-before-i-reboot
