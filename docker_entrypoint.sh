#!/bin/sh

# This is a hack to make the output file editable by a non-root user on the host.
# It doesn't solve the case when the user can't delete the file when written to
# /tmp (sticky bit)... More proper solution would be to pass host UID on the 
# command line, but I don't want this to be necessary.
umask 0000

# Now we detect whether this container is running with a TTY attached

if [ -t 0 ] ; then
  echo "./unpack [APK]"
  echo "make [ARGS]"
  bash
else
  FILE=$1
  shift
  ./unpack $FILE
  make "$@"
fi
