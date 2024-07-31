{
  pkgs,
  inputs,
  username,
  config,
  ...
}: {
  imports = [
    inputs.nixos-wsl.nixosModules.wsl
    ../../modules/nixos/default.nix
  ];

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

  networking.hostName = "wsl";

  programs = {
    ssh.startAgent = true;
    zsh.enable = true;
    nix-ld = {
      enable = true;
      libraries = config.hardware.opengl.extraPackages;
    };
    dconf.enable = true;
  };

  services = {
    ollama = {
      enable = true;
      acceleration = "cuda";
      openFirewall = true;
      host = "0.0.0.0";
      port = 11434;
    };
    tailscale.enable = true;
  };

  fonts.packages = with pkgs; [(nerdfonts.override {fonts = ["FiraCode" "JetBrainsMono"];})];

  system.stateVersion = "23.11";
}
