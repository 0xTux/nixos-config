{
  modulesPath,
  inputs,
  username,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/profiles/qemu-guest.nix")
    inputs.disko.nixosModules.default
    (import ./disko.nix {device = "/dev/sda";})

    ../common
  ];

  nixpkgs.hostPlatform = "x86_64-linux";

  networking = {
    hostName = "capella";
    firewall.enable = false;
  };

  boot.loader.grub = {
    efiSupport = true;
    efiInstallAsRemovable = true;
  };

  environment.persistence."/persist" = {
    enable = false;
  };

  home-manager.users.${username} = {
    imports = [
      ./home.nix
    ];
  };

  system.stateVersion = "24.11";
}
