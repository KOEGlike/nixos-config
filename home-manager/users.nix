{
  config,
  pkgs,
  home-manager,
  inputs,
  plasma-manager,
  ...
}:
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.koeg =
    { pkgs, ... }:
    {
      imports = [
        (import ./koeg/home.nix {
          inherit pkgs;
          inherit inputs;
          inherit config;
        })
      ];
    };
}
