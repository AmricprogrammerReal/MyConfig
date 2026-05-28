# .bash_profile

# Get the aliases and functions
export LIBVA_DRIVER_NAME=i965
export MOZ_X11_EGL=1
[ -f $HOME/.bashrc ] && . $HOME/.bashrc
# If we are on TTY1 and X isn't running yet, automatically start X
if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
    exec startx
fi
