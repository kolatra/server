# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, ... }:

{
  imports = [
    # include NixOS-WSL modules
    <nixos-wsl/modules>
    ./hardware-configuration.nix
  ];

  wsl.enable = true;
  wsl.defaultUser = "tyler";

  # allows VSCode server to run by enabling unpatched dynamic binaries
  programs.nix-ld.enable = true;

  environment.systemPackages = with pkgs; [
    git
    neovim
    wget
    fastfetch
  ];

  system.stateVersion = "24.11";
}
