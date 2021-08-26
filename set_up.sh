#!/usr/bin/env sh

# run flutter pub get

flutter pub get

# set up git hooks
FILE=.git/hooks/pre-push
if test -f "$FILE"; then
    rm $FILE
fi

ln -s ../../.git_hooks/pre-push.sh .git/hooks/pre-push
chmod +x .git_hooks/pre-push.sh