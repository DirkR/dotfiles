#!/bin/sh
ZPRESTO_DIR="${ZDOTDIR:-$HOME}/.zprezto"
if [ ! -d "$ZPRESTO_DIR" ]; then
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "$ZPRESTO_DIR"
fi
