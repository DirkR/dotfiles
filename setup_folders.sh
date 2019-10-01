#!/bin/bash

for folder in \
  $HOME/.local/bin
do
  [ -d $folder ] || mkdir $folder
done
