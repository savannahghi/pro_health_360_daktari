#!/usr/bin/env sh

# analyze dart code before pushing changes
echo 'Running flutter analyze...'
flutter analyze
ANALYSISRESULT=$?
echo -e '\n'

if [ $ANALYSISRESULT != 0 ]; then
    RED='\033[0;31m'
    printf "${RED}FIX THE ABOVE ERRORS AND WARNINGS BEFORE TRYING TO PUSH AGAIN! \n"
    exit 1
fi

printf "┏╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┓\n"
printf "┇ ✔️ ${GREEN}ALL CHECKS PASSED. PUSHING YOUR CODE.🚀. ✔️  ┇\n"
printf "┡╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┦\n"
exit 0
