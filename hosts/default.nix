{ args, username, nixpkgs, nixpkgs-unstable, home-manager, astronvim, ... }:

let
  system = "x86_64-linux";

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
    config.joypixels.acceptLicense = true;
  };

  pkgs-unstable = import nixpkgs-unstable {
    inherit system;
    config.allowUnfree = true;
    config.joypixels.acceptLicense = true;
  };
in
{
  sirius = nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit args username pkgs pkgs-unstable;
      hostname = "sirius";
    };
    modules = [

      # Common config 
      ./configuration.nix

      # Device specific config
      ./sirius/configuration.nix

      # Home Manager
      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = {
          inherit username pkgs pkgs-unstable astronvim;
        };
        home-manager.users.${username} = {
          imports = [

            # Common config
            ./home.nix

            # Device specific config
            ./sirius/home.nix
          ];
        };
      }
    ];
  };
}
