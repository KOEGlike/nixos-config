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
    rust-analyzer
    clippy
    cargo
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
    nvim-config.packages.x86_64-linux.default
    ldproxy
    cargo-generate
  ];

  environment.sessionVariables.EDITOR = "nvim";
}
