{ config, pkgs, inputs, ...}:

let 
  jre21 = pkgs.temurin-bin-21;

  # "Borrowed" from AllTheMods Discord
  jvmOpts = concatStringsSep " " [
    "-XX:+UseG1GC"
    "-XX:+ParallelRefProcEnabled"
    "-XX:MaxGCPauseMillis=200"
    "-XX:+UnlockExperimentalVMOptions"
    "-XX:+DisableExplicitGC"
    "-XX:+AlwaysPreTouch"
    "-XX:G1NewSizePercent=40"
    "-XX:G1MaxNewSizePercent=50"
    "-XX:G1HeapRegionSize=16M"
    "-XX:G1ReservePercent=15"
    "-XX:G1HeapWastePercent=5"
    "-XX:G1MixedGCCountTarget=4"
    "-XX:InitiatingHeapOccupancyPercent=20"
    "-XX:G1MixedGCLiveThresholdPercent=90"
    "-XX:G1RSetUpdatingPauseTimePercent=5"
    "-XX:SurvivorRatio=32"
    "-XX:+PerfDisableSharedMem"
    "-XX:MaxTenuringThreshold=1"
  ];

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
}
