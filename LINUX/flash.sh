#!/bin/bash
set -e

if [ "$EUID" -ne 0 ]
	then echo "Please be sure to run this script as root"
	exit 1
fi

function pause() {
   read -p "$*"
}

clear
echo "This script is developed and tested by me (scardracs)"
echo "for the Motorola Moto X Play/Pure/Style and distributed under GPL-2 license."
echo "Feel free to use and/or modify it without limits."
echo "I don't assume any responsibility if"
echo "You damage your device/s, You have been warned!"
echo
echo "Press any key to continue..."
pause
clear
echo "First of all please select your PC's OS."
echo "1 + enter for apt (debian/ubuntu/mint)."
echo "2 + enter for yum (fedora/red-hat)."
echo "3 + enter for pacman (archlinux/manjaro)."
echo "4 + enter for emerge (gentoo/funtoo/sabayon)."
echo "5 + enter for apk (alpine linux)."
echo "Any other values to stop this script and exit."
echo
echo "Any answer on that script MUST be lowercase."
echo
read A
case $A in
		1) apt install -y adb fastboot
		;;
		2) yum install android-tools
		;;
		3) pacman -Sy adb fastboot
		;;
		4) emerge --ask android-tools
		;;
		5) apk add android-tools
		;;
		*) echo "Script stopped!" && exit
	esac
clear
echo "REMEMBER, DON'T PRESS ANYTHING DURING THE FLASHING PROCESS!!"
echo "Are You Ready? (y/n)"
read B
case $B in
	y)
		echo "Do you want to delete userdata? (y/n)"
		read C
		case $C in
			y)
				clear
				echo "Wipe Script"
				adb reboot-bootloader
				fastboot oem fb_mode_set
				fastboot flash partition gpt.bin
				fastboot flash bootloader bootloader.img
				fastboot flash logo logo.bin
				fastboot flash boot boot.img
				fastboot flash recovery recovery.img
				fastboot flash system system.img_sparsechunk.0
				fastboot flash system system.img_sparsechunk.1
				fastboot flash system system.img_sparsechunk.2
				fastboot flash system system.img_sparsechunk.3
				fastboot flash system system.img_sparsechunk.4
				fastboot flash system system.img_sparsechunk.5
				fastboot flash system system.img_sparsechunk.6
				fastboot flash system system.img_sparsechunk.7
				fastboot flash system system.img_sparsechunk.8
				fastboot flash system system.img_sparsechunk.9
				fastboot flash system system.img_sparsechunk.10
				fastboot flash modem NON-HLOS.bin
				fastboot erase modemst1
				fastboot erase modemst2
				fastboot flash fsg fsg.mbn
				fastboot erase cache
				fastboot erase userdata
				fastboot erase customize
				fastboot erase clogo
				fastboot oem fb_mode_clear
				fastboot reboot
				clear
				exit
			;;
			n)
				clear
				echo "No Wipe Script"
				adb reboot-bootloader
				fastboot oem fb_mode_set
				fastboot flash partition gpt.bin
				fastboot flash bootloader bootloader.img
				fastboot flash logo logo.bin
				fastboot flash boot boot.img
				fastboot flash recovery recovery.img
				fastboot flash system system.img_sparsechunk.0
				fastboot flash system system.img_sparsechunk.1
				fastboot flash system system.img_sparsechunk.2
				fastboot flash system system.img_sparsechunk.3
				fastboot flash system system.img_sparsechunk.4
				fastboot flash system system.img_sparsechunk.5
				fastboot flash system system.img_sparsechunk.6
				fastboot flash system system.img_sparsechunk.7
				fastboot flash system system.img_sparsechunk.8
				fastboot flash system system.img_sparsechunk.9
				fastboot flash system system.img_sparsechunk.10
				fastboot flash modem NON-HLOS.bin
				fastboot erase modemst1
				fastboot erase modemst2
				fastboot flash fsg fsg.mbn
				fastboot erase cache
				fastboot erase customize
				fastboot erase clogo
				fastboot oem fb_mode_clear
				fastboot reboot
				clear
				exit
			;;
			*)
				clear
				echo "Script stopped!"
				exit
			;;
		esac
	;;
	*)
		clear
		echo "Script stopped!"
		exit
	;;
esac
exit
