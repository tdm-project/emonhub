# edge-emon433-handler

## Edge handler for Open Energy Monitor devices

To install on Edge device it is necessary to configure the serial port on raspberry pi 3 as described in:

Therefore:
$ sudo nano /boot/config.txt
and add the lines (at the bottom):
core_freq=250
enable_uart=1

You also need to remove the console from the cmdline.txt. If you edit this with:
$ sudo nano /boot/cmdline.txt
you will see something like:
dwc_otg.lpm_enable=0 console=serial0,115200 console=tty1 root=/dev/mmcblk0p2 rootfstype=ext4 elevator=deadline fsck.repair=yes root wait
remove the line: console=serial0,115200 and save and reboot for changes to take effect.

To check serial communication through GPIO:

minicom -D /dev/ttyS0 -b 38400

It a pacman -Syu is run an additiona service is added that may ruin the routing, therefore:

systemctl disable systemd-resolved.service

Container is run like this:
docker run -it --privileged --network tdm_edge tdmproject/edge-emon433-handler


