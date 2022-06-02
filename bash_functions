# Reboot directly to Windows
# Inspired by http://askubuntu.com/questions/18170/how-to-reboot-into-windows-from-ubuntu
# https://unix.stackexchange.com/questions/43196/how-can-i-tell-grub-i-want-to-reboot-into-windows-before-i-reboot
function reboot_to_windows ()
{
    windows_title=$(grep -i windows /boot/grub/grub.cfg | cut -d "'" -f 2)
    echo Windows boot option is "$windwos_title" && sleep 10
    sudo grub-reboot "$windows_title" && sudo reboot
}

function my_reboot_to_windows {
    WINDOWS_TITLE=`grep -i "^menuentry 'Windows" /boot/grub/grub.cfg | head -n 1 | cut -d"'" -f2`
    echo Windows boot option is "$WINDOWS_TITLE" && sleep 10
    sudo grub-reboot "$WINDOWS_TITLE"
    sudo reboot
}

function reboot_os {
    root_auth_status=$(sudo echo "Root access is granted")
    if [ "$?" -ne 0 ]; then
    echo "Root access is not granted"
      return -1
    fi

    OLDIFS=$IFS
    IFS=$'\n'
    MENU_ENTRIES=($(grep -i "^menuentry " /boot/grub/grub.cfg | cut -d"'" -f2))
    IFS=$OLDIFS

    let x=0
    for m in "${MENU_ENTRIES[@]}"; do
        echo  $x " - $m"
        let x+=1
    done
    echo
    echo -n "Please enter which os to reboot: " && read USER_CHOICE

    NEXT_BOOT_OS=${MENU_ENTRIES[$USER_CHOICE]}
    echo $NEXT_BOOT_OS

    echo Next boot os is "$NEXT_BOOT_OS"
    for i in `seq 10 -1 1` ; do echo -ne "\r$i " ; sleep 1 ; done
    sudo grub-reboot "$NEXT_BOOT_OS"
    sudo reboot now
}

#alias reboot-to-windows='reboot_to_windows'
alias reboot-to='reboot_os'
