#!/bin/sh
ZPRESTO_DIR="${ZDOTDIR:-$HOME}/.zprezto"
if [ -d "$ZPRESTO_DIR" ]; then
  rm -rf "$ZPRESTO_DIR"
fi
