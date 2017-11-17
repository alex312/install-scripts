#!/bin/bash

command -v apt-show-versions >/dev/null 2>&1 || {
    sudo apt-get install apt-show-versions
}
