#!/bin/bash

command -v assemble-config >/dev/null 2>&1 || ( echo "Missing command 'assemble-config', exiting." ; exit 0 )

for ddir in $(find $(dirname $0) -name *.d -type d)
do
  assemble-config ${ddir%.d}
done
