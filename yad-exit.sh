#!/bin/bash

yad --close-on-unfocus --columns=5 --form --mouse \
    --borders=15 --title="Exit" \
	--field="  Shutdown!gnome-shutdown!Shut Down":fbtn "$ld poweroff" \
	--field="  Reboot!system-reboot!Restart":fbtn "$ld reboot" \
	--field="  Log Out!gnome-logout!Log out":fbtn "loginctl terminate-user $USER" \
	--field="  Screen Lock!system-lock-screen!Lock the Screen":fbtn "lok" \
    --field="gtk-cancel":fbtn \
	--no-buttons 
