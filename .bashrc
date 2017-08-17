source ~/.git-prompt.sh
source /usr/share/bash-completion/completions/git

## rbenv
export PATH="$HOME/Scripts:$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PS1='\e[0;32m\u@\h\e[m: \e[0;36m\w\e[m$(__git_ps1) \n$ '

alias pbcopy="xclip -sel clip"
alias vg='vagrant'
alias be='bundle exec'
txt () {
  local face=${1:-shrug}
  local emoji=''
  case "$face" in 
  shrug) emoji='¯\_(ツ)_/¯' 
    ;;
  lenny) emoji='( ͡° ͜ʖ ͡°)'
    ;;
  disapprove) emoji='ಠ_ಠ'
    ;;
  flip) emoji='(╯°□°)╯︵ ┻━┻'
    ;;
  palm) emoji='(－‸ლ)'
    ;;
  *) echo "Enter a text face (shrug|lenny|disapprove|flip|palm)"
    ;;
  esac
  echo -n $emoji | pbcopy
  if [[ ! -z $emoji ]]; then
    echo "Copied $emoji to clipboard!"
  fi
}
export -f txt
ssh-add ~/.ssh/outreach_id_rsa
export MSF_DATABASE_CONFIG=/opt/metasploit-framework/config/database.yml
export VAULT_ADDR=http://127.0.0.1:8200
