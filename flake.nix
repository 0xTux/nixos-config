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
    wezterm-flake = {
      url = "github:wez/wezterm/main?dir=nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:nixos/nixos-hardware";
    nixpkgs-f2k.url = "github:moni-dz/nixpkgs-f2k";
    nur.url = "github:nix-community/nur";
    sops-nix.url = "github:Mic92/sops-nix";
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
      arcturus = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs username;};
        modules = [
          ./hosts/arcturus

          home-manager.nixosModules.home-manager
          {
            home-manager.backupFileExtension = "backup";
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {inherit inputs outputs username;};
            home-manager.users.${username} = {
              imports = [
                ./hosts/arcturus/home.nix
              ];
            };
          }
        ];
      };

      canopus = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs username;};
        modules = [
          ./hosts/canopus

          home-manager.nixosModules.home-manager
          {
            home-manager.backupFileExtension = "backup";
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {inherit inputs outputs username;};
            home-manager.users.${username} = {
              imports = [
                ./hosts/canopus/home.nix
              ];
            };
          }
        ];
      };

      alpha = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs username;};
        modules = [
          ./hosts/alpha

          home-manager.nixosModules.home-manager
          {
            home-manager.backupFileExtension = "backup";
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {inherit inputs outputs username;};
            home-manager.users.${username} = {
              imports = [
                ./hosts/alpha/home.nix
              ];
            };
          }
        ];
      };

      sirius = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs username;};
        modules = [
          ./hosts/sirius

          home-manager.nixosModules.home-manager
          {
            home-manager.backupFileExtension = "backup";
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {inherit inputs outputs username;};
            home-manager.users.${username} = {
              imports = [
                ./hosts/sirius/home.nix
              ];
            };
          }
        ];
      };

      isoImage = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs username;};
        modules = [
          ./hosts/isoImage

          home-manager.nixosModules.home-manager
          {
            home-manager.backupFileExtension = "backup";
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {inherit inputs outputs username;};
            home-manager.users.${username} = {
              imports = [
                ./hosts/isoImage/home.nix
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
