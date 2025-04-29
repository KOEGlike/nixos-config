{ config, pkgs, ... }:
{
  # Install firefox.
  programs.firefox.enable = true;

  xdg.mime.defaultApplications = {
    "text/html" = "firefox.desktop";
    "x-scheme-handler/http" = "firefox.desktop";
    "x-scheme-handler/https" = "firefox.desktop";
    "x-scheme-handler/about" = "firefox.desktop";
    "x-scheme-handler/unknown" = "firefox.desktop";
  };

  environment.sessionVariables.DEFAULT_BROWSER = "${pkgs.firefox}/bin/firefox";

  services.spotifyd.enable = true;

  environment.systemPackages = with pkgs; [
    qdirstat
    davinci-resolve
    discord
    spotify
    spotifyd
    slack
    brave
    firefox
    libreoffice-qt
    hunspell
    hunspellDicts.hu_HU
    sbctl
    kicad
  ];
}
