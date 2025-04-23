{ config, pkgs, ...}:

{
  imports = [ inputs.mms.module ];

  services.modded-minecraft-servers = {
    eula = true;

    gtnh = {
      enable = true;

      serverConfig = {
        server-port = 25565;
        motd = "GregTech: New Horizons 2.7";
      };
    };
  };
}
