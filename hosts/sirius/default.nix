{
  pkgs,
  inputs,
  username,
  config,
  ...
}: {
  imports = [
    inputs.nixos-wsl.nixosModules.wsl

    ../common
    ../../modules/nixos/virtualisation/docker.nix
  ];

  boot.binfmt.emulatedSystems = ["aarch64-linux"];

  nixpkgs = {
    config.cudaSupport = true;
    hostPlatform = "x86_64-linux";
  };

  wsl = {
    enable = true;
    defaultUser = "${username}";
    nativeSystemd = true;
    useWindowsDriver = true;
  };

  networking.hostName = "sirius";

  programs = {
    ssh.startAgent = true;
    zsh.enable = true;

    nix-ld = {
      enable = true;
      libraries = config.hardware.graphics.extraPackages;
      package = pkgs.nix-ld-rs;
    };

    dconf.enable = true;
  };

  fonts.packages = with pkgs; [(nerdfonts.override {fonts = ["FiraCode" "JetBrainsMono"];})];

  environment.persistence."/persist" = {
    enable = false;
  };

  system.stateVersion = "23.11";
}
