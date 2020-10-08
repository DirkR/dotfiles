#!/bin/sh
CURRENT=$(dirname $0)

ZSH="$HOME/.oh-my-zsh"
if [ ! -d "$ZSH" ]; then
    sh $CURRENT/ohmyzsh_installer.sh --unattended --keep-zshrc
fi

if [ ! -f "$ZSH/custom/source_local_config.zsh" ]; then
  cat > "$ZSH/custom/source_local_config.zsh" <<LOCALZSH
[ -f \$HOME/.zshrc.local ] && source \$HOME/.zshrc.local
[ -f \$HOME/.shellrc.load ] && source \$HOME/.shellrc.load
LOCALZSH
fi

if [ -f "$HOME/.zhistory"  -a ! -f "$HOME/.zsh_history" ]; then
  mv "$HOME/.zhistory" "$HOME/.zsh_history" 
fi
