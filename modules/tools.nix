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

  environment.systemPackages = with pkgs; [
    qdirstat
    davinci-resolve
    discord
    slack
    brave
    firefox
    libreoffice-qt
    hunspell
    hunspellDicts.hu_HU
    sbctl
    gimp3
    kikit
    (kicad.override { addons = [ pkgs.kicadAddons.kikit pkgs.kicadAddons.kikit-library ]; })
    kikit
    spotify
    freecad
    wakatime-cli
(blender.override {cudaSupport=true;})
  ];

  programs.obs-studio ={
    enable = true;
    plugins = with pkgs.obs-studio-plugins;[
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
  ];
  };
}
