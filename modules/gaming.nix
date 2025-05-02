{ config, pkgs, ... }:
{
  hardware.xone.enable = true;

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
    description = "Steam (no-GUI background startup)";
    after = [ "network.target" ]; # wait for networking
    wantedBy = [ "default.target" ]; # run when your session starts
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.steam}/bin/steam -nochatui -nofriendsui -silent";
      Restart = "on-failure";
      RestartSec = "5s";
    };
  };
}
