# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
# vim: set syntax=sh

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
umask 022

export EDITOR=vim
export VISUAL=vim

[ -f ~/.alias ] && . ~/.alias

. $HOME/.shellrc.load
