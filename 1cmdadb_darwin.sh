#!/bin/bash

path_contains() {
    case ":$PATH:" in
        *":$1:"*) return 0 ;;
        *) return 1 ;;
    esac
}

if [ -d "/Applications/platform-tools" ]; then
    rm -rf "/Applications/platform-tools"
fi

curl -Lo platform-tools-latest-darwin.zip https://dl.google.com/android/repository/platform-tools-latest-darwin.zip
unzip platform-tools-latest-darwin.zip -d /Applications/
rm platform-tools-latest-darwin.zip

if ! path_contains "/Applications/platform-tools"; then
    echo 'export PATH="$PATH:/Applications/platform-tools"' >> ~/.zshrc
    source ~/.zshrc
    echo "Added platform-tools to PATH"
else
    echo "platform-tools is already in PATH"
fi
