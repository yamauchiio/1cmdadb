#!/bin/bash

path_contains() {
    case ":$PATH:" in
        *":$1:"*) return 0 ;;
        *) return 1 ;;
    esac
}

if [ -d "/usr/local/platform-tools" ]; then
    rm -rf "/usr/local/platform-tools"
fi

curl -Lo platform-tools-latest-linux.zip https://dl.google.com/android/repository/platform-tools-latest-linux.zip
unzip platform-tools-latest-linux.zip -d /usr/local/
rm platform-tools-latest-linux.zip

if ! path_contains "/usr/local/platform-tools"; then
    echo 'export PATH="$PATH:/usr/local/platform-tools"' >> ~/.bashrc
    source ~/.bashrc
    echo "Added platform-tools to PATH"
else
    echo "platform-tools is already in PATH"
fi
