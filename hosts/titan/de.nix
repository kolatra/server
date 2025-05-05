{ config, pkgs, ... }:

{
  services = {
    displayManager = {
      # lightdm.enable = true;
      sddm.enable = true;
      sddm.wayland.enable = true;
    };

    desktopManager = {
      # cinnamon.enable = true;
      plasma6.enable = true;
    };
  };
}
