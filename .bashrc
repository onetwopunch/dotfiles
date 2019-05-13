source ~/.git-prompt.sh
source /usr/share/bash-completion/completions/git

export PS1='\e[0;32m\u@\h\e[m: \e[0;36m\w\e[m$(__git_ps1) \n$ '
export PATH=$HOME/Scripts:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin

alias tach="tmux attach-session -t"
alias pbcopy="xclip -sel clip"
alias vg='vagrant'
alias be='bundle exec'

