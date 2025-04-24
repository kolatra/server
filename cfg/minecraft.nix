{ config, pkgs, inputs, ...}:

let 
  jre21 = pkgs.temurin-bin-21;

  defaults = {
    white-list = true;
    spawn-protection = 0;
    max-tick-time = 5 * 60 * 1000;
    allow-flight = true;
  };
in {
  imports = [ inputs.mms.module ];

  services.modded-minecraft-servers = {
    eula = true;

    instances = {
      gtnh = {
        enable = true;
        jvmMaxAllocation = "8G";
        jvmInitialAllocation = "8G";
        jvmPackage = jre21;

        serverConfig = 
          defaults
            // {
            server-port = 25565;
            motd = "GregTech: New Horizons 2.7";
          };
      };
    };
  };
}
