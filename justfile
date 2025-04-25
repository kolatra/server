rebuild:
    sudo nixos-rebuild switch --flake .#titan

submodules:
    git submodule update --init --recursive
