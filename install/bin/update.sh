#!/bin/bash

source "$(dirname "$0")/source.sh"

cd "$ANSIBLE_DIR"
git pull origin master
cd "$PROJECT_DIR"
