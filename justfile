set shell := ["zsh", "-uc"]
set unstable

rebuild:
    sudo nixos-rebuild switch --flake .#titan

submodules:
    git submodule update --init --recursive

gc:
    sudo nix-collect-garbage -d && nix-collect-garbage -d

setup:
    rm -f ./cfg/hardware-configuration.nix
    sudo nixos-generate-config
    sudo mv /etc/nixos/hardware-configuration.nix ~/config/cfg/
    sudo chown tyler:users ./cfg/hardware-configuration.nix
    # so that the rebuild acknowledges the file
    git add ./cfg/hardware-configuration.nix

    just rebuild
    just setup-gtnh

    sudo systemctl start gtnh-mc.service

[script("sh")]
setup-gtnh:
    URL="https://downloads.gtnewhorizons.com/ServerPacks/GT_New_Horizons_2.7.4_Server_Java_17-21.zip"
    wget -O /tmp/archive.zip "$URL"
    mkdir ./gt
    unzip /tmp/archive.zip -d ./gt

    mv ./gt/startserver-java9.sh ./gt/start.sh
    # trying to get past Nix not including bash and not 
    # wanting to declare it in the config
    sed -i '1s|^#!.*|#!/bin/sh|' ./gt/start.sh
    chmod a+x ./gt/start.sh

    sudo mv ./gt/* /var/lib/mc-gtnh
    sudo mv ./scripts/justfile /var/lib/mc-gtnh/justfile
    sudo chown -R mc-gtnh:mc-gtnh /var/lib/mc-gtnh

    rm -rf ./gt
