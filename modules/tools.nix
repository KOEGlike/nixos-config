{config, pkgs, ...} :{
  # Install firefox.
  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    qdirstat
    davinci-resolve
    discord
    spotify
    slack
    brave
    firefox
    libreoffice-qt
    hunspell
    hunspellDicts.hu_HU
    sbctl
  ];
}