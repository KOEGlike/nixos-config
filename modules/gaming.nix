{ config, pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    config.boot.kernelPackages.xone
    temurin-bin-21
    prismlauncher
    lutris
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  systemd.user.services.steam = {
    enable = true;
    description = "Open Steam in the background at boot";
    serviceConfig = {
      ExecStart = "${pkgs.steam}/bin/steam -nochatui -nofriendsui -silent %U";
      wantedBy = [ "graphical-session.target" ];
      Restart = "on-failure";
      RestartSec = "5s";
    };
  };
}
