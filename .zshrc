# PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.config/bashscripts/:$PATH"

export PYTHONPATH=$PYTHONPATH:$HOME/Dropbox/python_packages

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh/"
export LC_ALL=en_US.UTF-8

ZSH_THEME="bersp"

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
export VISUAL='nvim'
export BAT_THEME='Nord'

### Aliases ###
# Commond aliases
alias v='nvim'
alias z='sw zathura'
alias V='vifm'
alias :q='exit'

# Aliases options
alias sxiv='sw sxiv -b'
alias zathura='zathura --fork'
alias bc='bc -il'
alias musicdl='youtube-dl -x -f bestaudio --audio-format mp3'
alias dotar='tar -czvf'
alias untar='tar -xzvf'
alias pyl='ipython --pylab'
alias pys='ipython -i -c "from sympy.abc import *;from sympy import *;import numpy as np"; One = Rational(1,1)'
alias t='trans -v es:en'
alias d='trans -d -v es:'
alias t-='trans -v en:es'
alias d-='trans -d -v en:'

# Folders and files
alias T='cd ~/Dropbox/Trabajos_propios'
alias B='cd ~/Dropbox/Bibliografía'
alias L='cd ~/Dropbox/Laboratorio'
alias P='cd ~/Dropbox/Proyectos'

# Test files
alias p.='nvim ~/testfiles/test.py'
alias l.='nvim ~/testfiles/test.lua'
alias m.='nvim ~/testfiles/NOTE.md'
alias o.='nvim ~/testfiles/NOTE.norg'
alias f.='nvim ~/testfiles/test.f90'

# Other
alias ssmake='sudo rm config.h && sudo make clean install'
alias open='xdg-open'
alias check-space='du -a | sort -n -r | head -n 5'
alias lg='lazygit'
alias gb='python ~/.config/bashscripts/get_bib.py'

export ZK_NOTEBOOK_DIR='/home/bersp/Dropbox/zk/'

# Git lenguaje
alias git='LANG=en_GB git'

# Pacman
alias pacman-list='pacman -Qq | fzf --preview "pacman -Qil {}" --layout=reverse --bind "enter:execute(pacman -Qil {} | less)"'

# Dotfiles bare repository
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Open 10bit tiff
sxiv10() { convert -depth 10 "$1" -depth 16 /tmp/16bittemp.tiff && sxiv /tmp/16bittemp.tiff }

### Fish highlighting ###
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# FZF
# [ -f ~/.config/dotfiles/.fzf.zsh ] && source ~/.config/dotfiles/.fzf.zsh

# BAT COLOR
# export BAT_THEME="Nord"


# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE="/home/bersp/bin/micromamba";
export MAMBA_ROOT_PREFIX="/home/bersp/micromamba";
__mamba_setup="$('/home/bersp/bin/micromamba' shell hook --shell bash --prefix '/home/bersp/micromamba' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    if [ -f "/home/bersp/micromamba/etc/profile.d/micromamba.sh" ]; then
        . "/home/bersp/micromamba/etc/profile.d/micromamba.sh"
    else
        export  PATH="/home/bersp/micromamba/bin:$PATH"  # extra space after export prevents interference from conda init
    fi
fi
unset __mamba_setup

alias mm='micromamba'
