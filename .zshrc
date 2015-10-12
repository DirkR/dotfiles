ZSH=$HOME/.oh-my-zsh
ZSH_THEME="candy"
# DISABLE_AUTO_UPDATE="true"
# DISABLE_AUTO_TITLE="true"
unset VIRTUAL_ENV_DISABLE_PROMPT
plugins=(git gitignore git-flow autojump drush pyenv pip mosh command-not-found zsh-syntax-highlighting frontend-search pass)

if [[ $(uname -s) = 'Darwin' ]] ; then
  plugins+=(brew brew-cask osx forklift terminalapp)
fi

source $ZSH/oh-my-zsh.sh
export PATH="/usr/local/bin:$PATH"

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

if [[ $(id -u) = '0' ]] ; then
  PROMPT=$'%n@%m %{$fg[red]%}[%T] %{$fg[white]%}%~%{$reset_color%}$(git_prompt_info)%{$reset_color%}\
%{$fg_bold[green]%}$%{$reset_color%} '
else
  PROMPT=$'%n@%m %{$fg[yellow]%}[%T] %{$fg[white]%}%~%{$reset_color%}$(git_prompt_info)%{$reset_color%}\
%{$fg_bold[green]%}$%{$reset_color%} '
fi

# Customize to your needs...
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH:$HOME/bin:/opt/X11/bin"

[ -d $HOME/.cabal/bin ] && export PATH="$PATH:$HOME/.cabal/bin"
[ -d $HOME/.composer/vendor/bin ] && export PATH="$PATH:$HOME/.composer/vendor/bin"
[[ $(uname -s) = 'Darwin' ]] && export PATH="$(brew --prefix php55)/bin:$PATH"

hash -d w2e=~/Projects/wake2e.de/
alias glue="python2.7 -m glue.bin"
alias xmake="XDEBUG_CONFIG="idekey=PHPSTORM" make"

. $HOME/.shellrc.load
