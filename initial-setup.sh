#!/bin/sh

# Remember to add SSH keys to the machine
# I won't add them to git :)

rm -f ./cfg/hardware-configuration.nix
sudo nixos-generate-config
sudo mv /etc/nixos/hardware-configuration.nix ~/config/cfg/
sudo chown tyler:users ./cfg/hardware-configuration.nix

sudo nixos-rebuild switch --flake .#titan

chmod +x ./scripts/gtnh.sh
./scripts/gtnh.sh

# sudo systemctl start gtnh-mc.service
