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
    impermanence.url = "github:nix-community/impermanence";
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
        modules = [./hosts/arcturus];
      };

      canopus = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs username;};
        modules = [./hosts/canopus];
      };

      alpha = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs username;};
        modules = [./hosts/alpha];
      };

      sirius = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs username;};
        modules = [./hosts/sirius];
      };

      vega = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs username;};
        modules = [./hosts/vega];
      };

      capella = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs username;};
        modules = [./hosts/capella];
      };

      vps = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs username;};
        modules = [./hosts/vps];
      };

      isoImage = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs username;};
        modules = [./hosts/isoImage];
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
