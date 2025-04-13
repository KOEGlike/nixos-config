{ config, pkgs, home-manager, ... }:
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.koeg = {pkgs, ...}:{
    programs.bash.enable = true;
    # The home.stateVersion option does not have a default and must be set
    home.stateVersion = "24.11";
    # Here goes the rest of your home-manager config, e.g. home.packages = [ pkgs.foo ];
  };
}
