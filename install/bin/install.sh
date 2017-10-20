#!/bin/bash

source "$(dirname "$0")/source.sh"

linkVagrantfile() {
    rm -f Vagrantfile
    ln -s ansible-config/Vagrantfile Vagrantfile
}

copyFiles() {
    if [ ! -e "$ANSIBLE_CONFIG" ]; then
        mkdir -p "$ANSIBLE_CONFIG"
        cp -R "$FILES_DIR"/install/* "$ANSIBLE_CONFIG"/
        mv "$ANSIBLE_CONFIG"/inventories/inventory.yml.dist "$ANSIBLE_CONFIG"/inventory.yml.dist
        rm -r "$ANSIBLE_CONFIG"/inventories
    else
        cp "$FILES_DIR"/install/Vagrantfile "$ANSIBLE_CONFIG"/Vagrantfile
    fi
}

cd "$PROJECT_DIR"
linkVagrantfile
copyFiles