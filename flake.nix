{
  description = "tux's NixOS Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-wsl = {
      url = "github:nix-community/nixos-wsl";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:nixos/nixos-hardware";
    nixpkgs-f2k.url = "github:moni-dz/nixpkgs-f2k";
    nur.url = "github:nix-community/nur";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
    forAllSystems = nixpkgs.lib.genAttrs [
      "x86_64-linux"
    ];
    username = "tux";
  in {
    packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    # Custom packages and modifications, exported as overlays
    overlays = import ./overlays {inherit inputs;};

    # NixOS configuration entrypoint
    # 'nixos-rebuild switch --flake .#your-hostname'
    nixosConfigurations = {
      canopus = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs username;};
        modules = [
          ./hosts/canopus

          ./modules/nixos/desktop/awesome
          ./modules/nixos/desktop/hyprland
          ./modules/nixos/virtualisation
          ./modules/nixos/steam.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {inherit inputs outputs username;};
            home-manager.users.${username} = {
              imports = [
                ./modules/home-manager
                ./modules/home-manager/hyprland
                ./modules/home-manager/waybar
                ./home/tux
              ];
            };
          }
        ];
      };

      controller = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs username;};
        modules = [
          ./hosts/controller
          ./modules/nixos/headscale.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {inherit inputs outputs username;};
            home-manager.users.${username} = {
              imports = [
                ./modules/home-manager
              ];
            };
          }
        ];
      };

      wsl = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs username;};
        modules = [
          ./hosts/wsl

          home-manager.nixosModules.home-manager
          {
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {inherit inputs outputs username;};
            home-manager.users.${username} = {
              imports = [
                ./modules/home-manager
              ];
            };
          }
        ];
      };
    };

    # Standalone home-manager configuration entrypoint
    # home-manager switch --flake .#your-username@your-hostname'
    homeConfigurations = {
      "${username}@canopus" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs username;};
        modules = [
          ./modules/home-manager
        ];
      };
    };
  };
}
