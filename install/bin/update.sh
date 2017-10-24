#!/bin/bash

source "$(dirname "$0")/source.sh"

cd "$ANSIBLE_DIR"
git pull origin master
git submodule update --recursive --remote
cd "$PROJECT_DIR"
