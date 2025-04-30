{
  config,
  pkgs,
  nvim-config,
  inputs,
  ...
}:
{

  virtualisation.docker.enable = true;
  environment.systemPackages = with pkgs; [
    temurin-bin-21
    git
    gh
    git-lfs
    rustup
    sqlx-cli
    cargo-leptos
    leptosfmt
    dart-sass
    openssl
    openssl.dev
    pkg-config
    gcc
    clang
    vscode
  ];
}
