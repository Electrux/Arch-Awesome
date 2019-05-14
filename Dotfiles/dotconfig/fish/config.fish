if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

if test "$FISH_LOGIN_LOADED" !=  "true"
	# Set bigger font
	#setfont sun12x22

	# Qt HiDPI scaling
	set -x QT_AUTO_SCREEN_SCALE_FACTOR 1
	# Qt theme
	set -x QT_QPA_PLATFORMTHEME "qt5ct"

	# GTK-3 HiDPI scaling
	set -x GDK_SCALE 2
	set -x GDK_DPI_SCALE 0.32
	# GTK disable overlay scrollbar
	set -x GTK_OVERLAY_SCROLLING 0

	# Important variables
	set -x EDITOR "/usr/bin/nvim"
	set -x TERMINAL "/usr/bin/alacritty"
	set -x BROWSER "/usr/bin/google-chrome-stable"
	set -x WALLPAPER "$HOME/Pictures/Wallpapers/Gorgeous-Palace-Fireworks.jpg"

	# Go lang directories
	set -x GOPATH "$HOME/.go"
	set -x PATH "$PATH:$GOPATH/bin"

	# Rust lang settings
	set -x PATH "$PATH:$HOME/.cargo/bin"

	# TODO: Having autologin screws up with eval/source.

	eval (keychain --eval --agents ssh (/usr/bin/ls ~/.ssh/id_rsa* | grep -v '.pub'))
	source ~/.keychain/$HOST-sh
	set -x FISH_LOGIN_LOADED "true"
else
	echo ''
	neofetch
end

alias vim="/usr/bin/nvim"

# set exa as ls command
alias ls='exa -s name -F'
alias l='ls -la'

# rsync as copy command
alias cp='rsync -ah --info=progress2'
# no preserve permissions
alias scpna='sudo rsync -h --info=progress2'

# Copy and paste
alias copy='xclip -sel clipboard'
alias paste='xclip -sel clipboard -o 2>/dev/null'

# Git shortcuts
alias gd='git diff'
alias gs='git status'
alias ga='git add'
alias gp='git push'
alias gpl='git pull'
alias gc='git commit'
alias gcl='git clone'

if set -q $DISPLAY && test "$XDG_VTNR" -eq 1
	exec startx
end
