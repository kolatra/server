#!/bin/sh

rm ./cfg/hardware-configuration.nix
sudo nixos-generate-config
sudo mv /etc/nixos/hardware-config.nix ~/config/cfg/
sudo chown tyler:users ./cfg/hardware-configuration.nix
