#!/bin/sh
VIMCMD=$( command -v nvim >/dev/null 2>&1 && echo nvim || echo vim )
echo "Found $VIMCMD"
$VIMCMD +PlugInstall +PlugUpdate +qall
