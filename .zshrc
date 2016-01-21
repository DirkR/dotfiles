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
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$PATH:$HOME/bin:/opt/X11/bin"

if [ -d /usr/local/var/pyenv ]; then
  export PYENV_ROOT=/usr/local/var/pyenv
elif [ -d $HOME/.pyenv ]; then
  export PYENV_ROOT=$HOME/.pyenv
fi
[ ! -z "$PYENV_ROOT" ] && export PATH="$PYENV_ROOT/bin:$PATH"

if which pyenv 2> /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init 2> /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
if which rbenv 2> /dev/null; then eval "$(rbenv init -)"; fi

[ -d $HOME/.cabal/bin ] && export PATH="$PATH:$HOME/.cabal/bin"
[ -d $HOME/.composer/vendor/bin ] && export PATH="$PATH:$HOME/.composer/vendor/bin"

alias glue="python2.7 -m glue.bin"
alias xmake="XDEBUG_CONFIG="idekey=PHPSTORM" make"
alias xdrush="XDEBUG_CONFIG="idekey=PHPSTORM" drush"

hash -d www=~/web
hash -d beta=~/web_beta
hash -d release=~/web_release

[ -f $HOME/.zshrc.local ] && . $HOME/.zshrc.local
. $HOME/.shellrc.load
