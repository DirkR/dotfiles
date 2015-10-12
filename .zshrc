# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="candy"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

#export VIRTUAL_ENV_DISABLE_PROMPT=0
unset VIRTUAL_ENV_DISABLE_PROMPT

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
export PATH=/usr/local/bin:~/.phpenv/bin:$PATH
plugins=(git gitignore git-flow autojump brew brew-cask drush pyenv pip mosh osx forklift emacs command-not-found zsh-syntax-highlighting frontend-search pass mosh terminalapp atom)

source $ZSH/oh-my-zsh.sh
#export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
#source /usr/local/bin/virtualenvwrapper.sh
#unset VIRTUAL_ENV_DISABLE_PROMPT

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
eval "$(rbenv init -)"
eval "$(phpenv init -)"

PROMPT=$'%n@%m %{$fg[yellow]%}[%T] %{$fg[white]%}%~%{$reset_color%}$(git_prompt_info)%{$reset_color%}\
%{$fg_bold[green]%}$%{$reset_color%} '

# Customize to your needs...
#export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
#export PATH=/Users/dirk/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/dirk/bin:/opt/X11/bin
export PATH=$PATH:/usr/local/opt/ruby/bin
export PATH=$HOME/.cabal/bin:$HOME/.composer/vendor/bin:$PATH
export PATH=$HOME/.rbenv/shims:$PATH
#export PATH="$(brew --prefix homebrew/php/php55)/bin:$PATH"

export PATH="$HOME/.composer/vendor/bin:$(brew --prefix php55)/bin:$PATH"

hash -d w2e=~/Projects/wake2e.de/
alias f='open -a Finder ./'
alias glue="python2.7 -m glue.bin"
alias dotploy=~/Projects/dotploy/dotploy.sh
alias xmake="XDEBUG_CONFIG="idekey=PHPSTORM" make"

. $HOME/.shellrc.load
