#!/bin/bash
HERE=$(realpath $(dirname $0))
for ddir in $(find $(dirname $0) -name *.d -type d)
do
  $HERE/.local/bin/assemble-config ${ddir%.d}
done
