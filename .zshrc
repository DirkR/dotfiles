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

if [[ $(uname -s) = 'Darwin' ]]
then
  export PYENV_ROOT=/usr/local/var/pyenv
  export PATH="$PYENV_ROOT/bin:$PATH"
fi

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

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
