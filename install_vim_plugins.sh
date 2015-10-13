#!/bin/sh
vim +PlugInstall +qall
( cd ~/.vim/plugged/vimproc.vim/ ; make )
