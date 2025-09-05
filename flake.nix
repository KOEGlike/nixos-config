{
  description = "OS configuration for NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvim-config = {
      url = "github:KOEGLike/nvim-config";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nvim-config,
      plasma-manager,
      ...
    }@inputs:
    {

      nixosConfigurations.koeg-station = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix


          
        ];
        specialArgs = {
          inherit self;
          inherit home-manager;
          inherit inputs;
          inherit nvim-config;
          inherit plasma-manager;
        };
      };

    };
}
