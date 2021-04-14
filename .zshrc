# PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.config/bashscripts/:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh/"
export LC_ALL=en_US.UTF-8

ZSH_THEME="lambda"

CASE_SENSITIVE="true"

source $ZSH/oh-my-zsh.sh

## User configuration ##
# Use vim keys in tab complete menu:
	bindkey -M menuselect 'h' vi-backward-char
	bindkey -M menuselect 'k' vi-up-line-or-history
	bindkey -M menuselect 'l' vi-forward-char
	bindkey -M menuselect 'j' vi-down-line-or-history
	bindkey -M menuselect '<esc>' .

# Change cursor shape for different vi modes.
	function zle-keymap-select {
	  if [[ ${KEYMAP} == vicmd ]] ||
		 [[ $1 = 'block' ]]; then
		echo -ne '\e[1 q'
	  elif [[ ${KEYMAP} == main ]] ||
		   [[ ${KEYMAP} == viins ]] ||
		   [[ ${KEYMAP} = '' ]] ||
		   [[ $1 = 'beam' ]]; then
		echo -ne '\e[5 q'
	  fi
	}
	zle -N zle-keymap-select
	zle-line-init() {
		zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
		echo -ne "\e[5 q"
	}
	zle -N zle-line-init
	echo -ne '\e[5 q' # Use beam shape cursor on startup.
	preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Vim mode
	bindkey -v
	export KEYTIMEOUT=1
	bindkey "^?" backward-delete-char


# Some defoults
export EDITOR='nvim'
export BAT_THEME='Nord'

### Aliases ###
# Commond aliases
alias v='nvim'
alias z='sw zathura'
alias V='vifm'
alias :q='exit'

# Aliases options
alias sxiv='sw sxiv -b'
alias bc='bc -il'
alias musicdl='youtube-dl -x -f bestaudio --audio-format mp3'
alias dotar='tar -czvf'
alias untar='tar -xzvf'

# Folders and files
alias T='cd ~/Dropbox/Trabajos_propios'
alias B='cd ~/Dropbox/Bibliografía'
alias L='cd ~/Dropbox/Laboratorio'
alias P='cd ~/Dropbox/Proyectos'
alias tt='nvim ~/test.py'

# Other
alias VPN='bash ~/.config/bashfiles/ssh_vpn'
alias ssmake='sudo rm config.h && sudo make clean install'
alias open='xdg-open'
alias check-space='du -a | sort -n -r | head -n 5'

# Latex tlmgr
alias tlmgr='/usr/share/texmf-dist/scripts/texlive/tlmgr.pl --usermode'

# Git lenguaje
alias git='LANG=en_GB git'

# Pacman
alias pacman-list='pacman -Qq | fzf --preview "pacman -Qil {}" --layout=reverse --bind "enter:execute(pacman -Qil {} | less)"'

# Dotfiles bare repository
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

### Fish highlighting ###
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# FZF
# [ -f ~/.config/dotfiles/.fzf.zsh ] && source ~/.config/dotfiles/.fzf.zsh

# BAT COLOR
# export BAT_THEME="Nord"
