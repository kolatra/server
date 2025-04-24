{ config, lib, imports, pkgs, ... }:

{
  services.samba = {
    enable = true;
    securityType = "user";
    openFirewall = true;
    settings = {
      global = {
        "workgroup" = "WORKGROUP";
        "server string" = "smbnix";
        "netbios name" = "smbnix";
        "security" = "user";
        "guest account" = "nobody";
        "map to guest" = "bad user";
      };
      "tyler" = {
        "path" = "/home/tyler"
        "browseable" = "yes";
        "guest ok" = "no";
        "force user" = "tyler";
      };
      "tyler-hdd" = {
        "path" = "/hdd"
        "browseable" = "yes";
        "guest ok" = "no";
        "force user" = "tyler";
      };
    };
  };

  services.samba-wsdd = {
    enable = true;
    openFirewall = true;
  };
}
