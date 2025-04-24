rebuild:
    sudo nixos-rebuild switch --flake .#titan

home:
    home-manager switch --flake .

submodules:
    git submodule update --init --recursive
