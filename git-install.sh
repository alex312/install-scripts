#!/bin/bash
# Install and Config git

command -v git >/dev/null 2>&1 || {
echo >&2 "Install git";
sudo apt-get install git;
}

git version;
