#!/bin/bash

source "$(dirname "$0")/source.sh"

cd "$ANSIBLE_DIR"
git submodule init
git submodule update

cd "$PROJECT_DIR"
git submodule init
git submodule update