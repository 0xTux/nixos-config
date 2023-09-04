{
  description = "tux's NixOS Flake";

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-23.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    astronvim.url = "github:AstroNvim/AstroNvim/v3.36.7";
    astronvim.flake = false;
  };

  outputs = args@ { nixpkgs, nixpkgs-unstable, home-manager, astronvim, ... }:
    let
      username = "tux";
    in
    {
      nixosConfigurations = (
        import ./hosts {
          inherit args username nixpkgs nixpkgs-unstable home-manager astronvim;
        }
      );
    };
}
