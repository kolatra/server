# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  system.stateVersion = "24.11";

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "titan"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Edmonton";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  users.users.tyler = {
    isNormalUser = true;
    description = "tyler";
    home = "/home/tyler";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    openssh.authorizedKeys.keys = [  "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDmHhoC/xqai4oYPylYFXNZZlbuot8wS4Czr0XNGiTEI0pCh8eRl608ZeObrYvlfp5Ddp4uqQlSNLm/VLpzDU3KNwmfxn3YCs7KQJOxzHkhAYjVDVbqF0EIQ5SPHbNvzPUx6xTVAgSxlscpcR8iHUBH0Td4seYfgifa3eQqLT8K7bSNWh0o7OXnZSkzXsd9NIQxpbD7zN8Sg2vKZM22tWXojvdgDW2zPZMi4IFKENSVWm15yJ32y0I1iaGI78pbg0F4o8qES562ThPZWjk0FJSAB6JEGgO/VHqIaurMTB7odRea4Fgt5vPM9gg3NtYDtgDrX2K7aGJ6Ja74pAzZXJ7BpQa5cuil6BUtJxen6qoVzG/xrnA4y63SG/6ZBpHOD7/Kehxs55sESOiu2QnpwLXq75E6UyXQSa/uK6KZa9nIx0Myb5WDRl7aVxCWz/bYRVNq54RljuiMQd9zIb7I9OYNW/BRFink6pZYbZHjZJwRM8V5hRmvyXRBQ9Hxh1Uiq9E= tyler" ];
  };

  # Enable experimental settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
     git
     btop
     gnumake
     gcc
     neovim
     wget
     fastfetch
     just
  ];

  environment.variables.EDITOR = "nvim";

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.openssh = {
	enable = true;
	settings = {
		X11Forwarding = true;
		PermitRootLogin = "no";
		PasswordAuthentication = false;
	};
	openFirewall = true;
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  
  virtualisation.docker.enable = true;
}
