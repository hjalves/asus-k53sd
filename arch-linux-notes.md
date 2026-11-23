# ASUS K53SD

This file contains some notes about running Arch Linux on this machine.

## Display

Disable the dedicated GPU, it's worthless.

Create `/etc/modprobe.d/blacklist-nouveau.conf` with:

```
blacklist nouveau
options nouveau modeset=0
```

To disable the removed built-in LCD, add this to /etc/default/grub:

```
GRUB_CMDLINE_LINUX_DEFAULT="video=LVDS-1:d"
```

## Bluetooth

Install the AUR package: bcm20702a1-firmware

