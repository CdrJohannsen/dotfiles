# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
PS1="\[\e[1;36m\]\u \w\$ \[\e[0m\]"
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

shopt -s checkwinsize

if [ -f ~/.bash_aliases ]; then
 . ~/.bash_aliases
fi

# history
HISTSIZE=1000000
HISTFILESIZE=100000000

# ranger
export VISUAL=nvim;
export EDITOR=nvim;

# colors


echo -en "\e]P0000000" #black
echo -en "\e]P1D75F5F" #darkred
echo -en "\e]P287AF5F" #darkgreen
echo -en "\e]P3D7AF87" #brown
echo -en "\e]P48787AF" #darkblue
echo -en "\e]P5BD53A5" #darkmagenta
echo -en "\e]P65FAFAF" #darkcyan
echo -en "\e]P7E5E5E5" #lightgrey
echo -en "\e]P82B2B2B" #darkgrey
echo -en "\e]P9E33636" #red
echo -en "\e]PA98E34D" #green
echo -en "\e]PBFFD75F" #yellow
echo -en "\e]PC7373C9" #blue
echo -en "\e]PDD633B2" #magenta
echo -en "\e]PE44C9C9" #cyan
echo -en "\e]PFFFFFFF" #white
clear #for background artifacting

if [ $TERM == "linux" ]; then
    setfont /usr/lib/kbd/consolefonts/ter-h16n.psf.gz
fi

if [ $TERM != "linux" ]; then
    eval "$(starship init bash)"
fi

#startup
#cat ~/.gnu_linux
fortune -s | cowsay
