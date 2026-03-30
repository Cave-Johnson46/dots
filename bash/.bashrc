#
# ~/.bashrc
#
export PATH=~/.cargo/bin:$PATH


tac "$HISTFILE" | awk '!x[$0]++' > /tmp/tmpfile  &&
                tac /tmp/tmpfile > "$HISTFILE"
rm /tmp/tmpfile



eval "$(starship init bash)"


shopt -s histappend

export HISTSIZE=1000
export HISTFILESIZE=10000
export HISTCONTROL=ignoreboth:erasedups



# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

export EDITOR=nvim

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}


alias ythdr='ENABLE_HDR_WSI=1 mpv'

alias hist='cat ~/.bash_history | fzf | sh'
