{ config, pkgs, home-manager, ... }:
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.koeg = {pkgs, ...}:{
    imports =[./koeg/home.nix];
  };
}
