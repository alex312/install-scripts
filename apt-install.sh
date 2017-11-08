#!/bin/bash

command -v apt-show-versions >/dev/null 2>&1
if [ "$?" -eq 1 ]; then
    sudo apt-get install apt-show-versions
fi
