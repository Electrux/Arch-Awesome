# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/elec/.oh-my-zsh

ZSH_THEME="lambda-mod-zsh-theme/lambda-mod"

plugins=(git)

source $ZSH/oh-my-zsh.sh

autoload -Uz compinit
compinit

# Set zsh autosuggestions path
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Set zsh syntax highlighting path
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Make output of less command colorized.
# Colors
default=$(tput sgr0)
red=$(tput setaf 1)
green=$(tput setaf 2)
purple=$(tput setaf 5)
orange=$(tput setaf 9)

# Less colors for man pages
#export PAGER=less
# Begin blinking
export LESS_TERMCAP_mb=$red
# Begin bold
export LESS_TERMCAP_md=$orange
# End mode
export LESS_TERMCAP_me=$default
# End standout-mode
export LESS_TERMCAP_se=$default
# Begin standout-mode - info box
export LESS_TERMCAP_so=$purple
# End underline
export LESS_TERMCAP_ue=$default
# Begin underline
export LESS_TERMCAP_us=$green

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

neofetch
