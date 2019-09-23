#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Dirk Ruediger <dirk@niebegeg.net>

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH:$HOME/bin:/opt/X11/bin"

if [ -d /usr/local/var/pyenv ]; then
  export PYENV_ROOT=/usr/local/var/pyenv
elif [ -d $HOME/.pyenv ]; then
  export PYENV_ROOT=$HOME/.pyenv
fi
[ ! -z "$PYENV_ROOT" ] && export PATH="$PYENV_ROOT/bin:$PATH"

# See http://stackoverflow.com/questions/592620/check-if-a-program-exists-from-a-bash-script
command -v pyenv >/dev/null 2>&1 && eval "$(pyenv init -)"
command -v pyenv-virtualenv-init >/dev/null 2>&1 && eval "$(pyenv virtualenv-init -)"
command -v rbenv >/dev/null 2>&1 && eval "$(rbenv init -)"
command -v urxvt >/dev/null 2>&1 && export TERMINAL=urxvt

hash -d www=~/web
hash -d beta=~/web_beta
hash -d release=~/web_release

[ -f $HOME/.zshrc.local ] && source $HOME/.zshrc.local
source $HOME/.shellrc.load

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
