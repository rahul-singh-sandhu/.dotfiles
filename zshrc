PF_ASCII=tux PF_INFO="ascii title os host kernel uptime pkgs memory" pfetch

plugins=(
	z
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
)

autoload -Uz vcs_info
precmd () { vcs_info }
zstyle ':vcs_info:*' formats ' %s(%F{red}%b%f)'
PS1='%n@%m %F{red}%~%f$vcs_info_msg_0_ # '

source $ZSH/oh-my-zsh.sh

alias zshconfig="nvim ~/.zshrc"
alias emerge="sudo emerge"
alias world-update="sudo emerge -auvDN @world"
alias dispatch-conf="sudo dispatch-conf"
alias portage-makeconf="sudo -e /etc/portage/make.conf"
