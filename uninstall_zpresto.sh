#!/bin/sh
ZPRESTO_RC="${ZDOTDIR:-$HOME}/.zpreztorc"
ZPRESTO_DIR="${ZDOTDIR:-$HOME}/.zprezto"
if [ -f "$ZPRESTO_RC" ]; then
  rm -f "$ZPRESTO_RC"
fi
if [ -d "$ZPRESTO_DIR" ]; then
  rm -rf "$ZPRESTO_DIR"
fi
