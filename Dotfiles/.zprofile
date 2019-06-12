# Set bigger font
setfont sun12x22

# Qt HiDPI scaling
export QT_AUTO_SCREEN_SCALE_FACTOR=1
# Qt theme
export QT_QPA_PLATFORMTHEME="qt5ct"

# GTK-3 HiDPI scaling
export GDK_SCALE=2
export GDK_DPI_SCALE=0.32
# GTK disable overlay scrollbar
export GTK_OVERLAY_SCROLLING=0

# Important variables
export EDITOR="/usr/bin/nvim"
export TERMINAL="/usr/bin/alacritty"
export BROWSER="/usr/bin/google-chrome-stable"
export WALLPAPER="$HOME/Pictures/Wallpapers/Gorgeous-Palace-Fireworks.jpg"

# Go lang directories
export GOPATH="$HOME/.go"
export PATH="$PATH:$GOPATH/bin"

# Rust lang settings
export PATH="$PATH:$HOME/.cargo/bin"

# TODO: Having autologin screws up with eval/source.
eval $(keychain --eval --agents ssh $(/usr/bin/ls ~/.ssh/id_rsa* | grep -v '.pub'))
source ~/.keychain/$HOST-sh

# Compile + Run a source file
run() {
	filename="${1%%.*}"
	ext="${1#*.}"
	if [[ "$ext" == "c" ]]; then
	        $(echo "gcc $@ -o ${filename} ${CPPFLAGS} ${LDFLAGS}") && echo "Executing ${filename}" && ./${filename}
	elif [[ "$ext" == "cpp" ]]; then
	        $(echo "g++ -std=c++17 $@ -o ${filename} ${CPPFLAGS} ${LDFLAGS}") && echo "Executing ${filename}" && ./${filename}
	elif [[ "$ext" == "rs" ]]; then
                rustc $@ && ./${filename}
        elif [[ "$ext" == "d" ]]; then
                dmd $@ && ./${filename}
	elif [[ "$ext" == "py" ]]; then
	        python3 $@
	elif [[ "$ext" == "java" ]]; then
		javac $@ && echo "Executing ${filename}" && java ${filename}
	fi
}

if [[ ! "$DISPLAY" && "$XDG_VTNR" -eq 1 ]]; then
	exec startx
fi
