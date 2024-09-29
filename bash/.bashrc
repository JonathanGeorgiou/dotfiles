# Commands that should be applied only for interactive shells.
[[ $- == *i* ]] || return

HISTFILESIZE=100000
HISTSIZE=10000

export EDITOR=nvim

shopt -s histappend
shopt -s checkwinsize
shopt -s extglob
shopt -s globstar
shopt -s checkjobs

alias bevy='toolbox run -c bevy'
#alias cat='bat'
#alias catp='bat -P'
#alias wezterm='flatpak run org.wezfurlong.wezterm'
alias eza='eza '\''--group-directories-first'\'' '\''--header'\'''
alias la='eza -a'
alias ll='eza -la'
alias ls='eza'
alias lt='eza --tree'
alias search-flatpak='flatpak remote-ls | grep -i'
alias vi='clevernvim.sh'
alias ansible-kde='ansible-playbook -i inventory start.yml --ask-become-pass'
alias lg='lazygit'

export PATH=$PATH:~/.local/bin/:~/.cargo/bin/


if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

eval "$(starship init bash)"
