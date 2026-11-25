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


## Desktop auto-start

There is no display manager. Login on tty1 runs [`dotfiles/.zprofile`](dotfiles/.zprofile)
(copy it to `~/.zprofile`). After a 10-second countdown it starts XFCE on Wayland
with `startxfce4 --wayland`, which uses labwc as the compositor by default. Press any key
during the countdown to cancel and get a `screen` session instead. Other local ttys go
straight to `screen`, and SSH logins are left alone.

The XFCE block must come before the `screen` one. `exec screen` replaces the login
shell, and inside screen `$TTY` is a pty, so nothing after it would ever run.
