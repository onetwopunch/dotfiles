source ~/.git-prompt.sh
source /usr/share/bash-completion/completions/git

export PS1='\e[0;32m\u@\h\e[m: \e[0;36m\w\e[m$(__git_ps1) \n$ '
export PATH=$HOME/Scripts:$PATH

alias pbcopy="xclip -sel clip"
alias vg='vagrant'
alias be='bundle exec'
export MSF_DATABASE_CONFIG=/opt/metasploit-framework/config/database.yml
export VAULT_ADDR=http://127.0.0.1:8200

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
