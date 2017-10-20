#!/bin/bash

source "$(dirname "$0")/source.sh"

linkVagrantfile() {
    rm -f "$PROJECT_DIR"/Vagrantfile
    ln -s "$ANSIBLE_DIR"/Vagrantfile "$PROJECT_DIR"/Vagrantfile
}

copyFiles() {
    if [ ! -e "$ANSIBLE_CONFIG" ]; then
        mkdir -p "$ANSIBLE_CONFIG"
        cp -R "$ANSIBLE_DIR"/install/files/* "$ANSIBLE_CONFIG"/
        mv "$ANSIBLE_CONFIG"/inventories/inventory.yml "$ANSIBLE_CONFIG"/inventory.yml
        rm -r "$ANSIBLE_CONFIG"/inventories
    fi

    cp "$ANSIBLE_DIR"/Vagrantfile "$ANSIBLE_CONFIG"/Vagrantfile
}

cd "$PROJECT_DIR"
copyFiles
linkVagrantfile
