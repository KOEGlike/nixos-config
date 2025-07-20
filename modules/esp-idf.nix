{ config, pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    git
    wget
    gnumake

    flex
    bison
    gperf
    pkg-config

    cmake

    espup
    esp-generate

    ncurses5

    ninja

    (python3.withPackages (
      p: with p; [
        pip
        virtualenv
      ]
    ))
  ];
}
