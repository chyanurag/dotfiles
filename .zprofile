export GTK_THEME=Arc-Dark
export GDK_DPI_SCALE=1.0
export XDG_CURRENT_DESKTOP=sway
export QT_QPA_PLATFORM=wayland
export PATH=$PATH:$HOME/.local/bin:$HOME/.cargo/bin
PS1='%F{blue}%~ %(?.%F{green}.%F{red})%#%f '
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	sway
fi
