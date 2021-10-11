#!/usr/bin/env bash
set -o pipefail
echo "=== INSTALLING FLUTTER ==="
git clone --single-branch --branch 2.5.2 -q https://github.com/flutter/flutter.git /home/circleci/flutter/
export PATH=PATH="$PATH:/home/circleci/flutter/bin"
flutter upgrade && flutter config --no-analytics
flutter --version  
flutter pub get
echo "=== INSTALLING FIREBASE TOOLS ==="
curl -sL https://firebase.tools | bash