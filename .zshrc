#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$PATH:$HOME/bin:/opt/X11/bin"

if [[ $(which pyenv 2>&1 > /dev/null) = '0' ]]; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi
if [[ $(which rbenv 2>&1 > /dev/null) = '0' ]]; then
  eval "$(rbenv init -)"
fi
if [[ $(which phpenv 2>&1 > /dev/null) = '0' ]]; then
  eval "$(phpenv init -)"
fi


[ -d $HOME/.cabal/bin ] && export PATH="$PATH:$HOME/.cabal/bin"
[ -d $HOME/.composer/vendor/bin ] && export PATH="$PATH:$HOME/.composer/vendor/bin"
[[ $(uname -s) = 'Darwin' ]] && export PATH="$(brew --prefix php55)/bin:$PATH"

hash -d w2e=~/Projects/wake2e.de/
alias glue="python2.7 -m glue.bin"
alias xmake="XDEBUG_CONFIG="idekey=PHPSTORM" make"
alias xdrush="XDEBUG_CONFIG="idekey=PHPSTORM" drush"

. $HOME/.shellrc.load
