# On tty1 (local console only), start XFCE Wayland after 10 seconds unless a key is pressed
if [[ "$TTY" == /dev/tty1 && -z "$SSH_CONNECTION" && -z "$WAYLAND_DISPLAY" && -z "$DISPLAY" ]]; then
    echo "Starting XFCE Wayland in 10 seconds (press any key to cancel)..."

    if ! read -r -s -t 10 -k 1; then
        exec startxfce4 --wayland
    fi

    echo
    echo "Automatic startup cancelled."
fi

# Automatically start screen on local console, never over SSH
if [[ -z "$SSH_CONNECTION" && -z "$STY" && "$TTY" == /dev/tty<-> ]]; then
    exec screen
fi
