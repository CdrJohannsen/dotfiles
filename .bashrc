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

# man
export MANPAGER="nvim +Man!" # Not really an alias...

# history
HISTSIZE=1000000
HISTFILESIZE=100000000
export HISTCONTROL=ignoredups

# ranger
export VISUAL=nvim;
export EDITOR=nvim;

# cargo
export CARGO_HOME="$HOME"/.local/share/cargo
. "$CARGO_HOME/env"

# rustup
export RUSTUP_HOME="$HOME"/.local/share/rustup

# java
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$HOME"/.config/java
export _JAVA_OPTIONS="$_JAVA_OPTIONS -Djavafx.cachedir="$HOME"/.cache/openjfx"

# platformio
export PLATFORMIO_CORE_DIR="$HOME"/.local/share/platformio

# TeX Live
export TEXMFHOME=$HOME/.local/share/texmf
export TEXMFVAR=$HOME/.cache/texlive/texmf-var
export TEXMFCONFIG=$HOME/.config/texlive/texmf-config

# go
export GOPATH="$HOME"/.local/share/go
export GOMODCACHE="$HOME"/.cache/go/mod

# python
export PYTHON_HISTORY=$HOME/.local/state/python_history

# sqlite
export SQLITE_HISTORY=$HOME/.local/share/sqlite_history


# colors
if [ $TERM == "linux" ]; then
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

    setfont /usr/lib/kbd/consolefonts/ter-h16n.psf.gz
fi


if [ $TERM != "linux" ]; then
    eval "$(starship init bash)"
fi

#startup
date +"%R" | figlet -f future | lolcat -b -g f5c211:dd5500 -h 1 -f | sed -e "s/^/$(printf '%.0s ' $(seq $(expr $(expr `tput cols` / 2) - 6)))/" | sed -r "/^\s*$/d" && echo -en "\r\x1b[2K"
