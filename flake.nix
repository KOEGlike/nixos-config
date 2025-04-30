{
  description = "OS configuration for NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";

      # Optional but recommended to limit the size of your system closure.
      inputs.nixpkgs.follows = "nixpkgs";
    };


    nixCats.url = "github:BirdeeHub/nixCats-nvim";
    nvim-config = {
      # Use the actual path to your nvim-config project
      url = "github:KOEGLike/nvim-config";
      # Since it's a local path and likely shares inputs, prevent refetching
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nixCats.follows = "nixCats"; # Make sure nixCats is also an input here or below
    };
    # Ensure nixCats is an input if your nvim-config depends on it
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      lanzaboote,
      nixCats,
      nvim-config,
    }@inputs:
    {

      nixosConfigurations.koeg-station = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix

          lanzaboote.nixosModules.lanzaboote

          nvim-config.nixosModules.default
          nixCats.nixosModules.default

          ({ pkgs, lib, ... }: {

            environment.systemPackages = [
              # For debugging and troubleshooting Secure Boot.
              pkgs.sbctl
            ];

            # Lanzaboote currently replaces the systemd-boot module.
            # This setting is usually set to true in configuration.nix
            # generated at installation time. So we force it to false
            # for now.
            boot.loader.systemd-boot.enable = lib.mkForce false;

            boot.lanzaboote = {
              enable = true;
              pkiBundle = "/var/lib/sbctl";
            };
          })
        ];
        specialArgs = {
          inherit self;
          inherit home-manager;
          inherit inputs;
          inherit nvim-config;
        };
      };

    };
}
