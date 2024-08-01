{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/default.nix
    ../../modules/nixos/headscale.nix
    ../../modules/nixos/vaultwarden.nix
    ../../modules/nixos/uptime-kuma.nix
    ../../modules/nixos/gitea.nix
    ../../modules/nixos/monitoring/grafana.nix
    ../../modules/nixos/monitoring/loki.nix
    ../../modules/nixos/monitoring/promtail.nix
  ];

  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    initrd.systemd.enable = true;

    loader = {
      grub.device = "/dev/sda";
      timeout = 1;
    };
  };

  networking = {
    hostName = "controller";
  };

  security = {
    sudo.wheelNeedsPassword = false;
  };

  programs = {
    zsh.enable = true;
    nix-ld = {
      enable = true;
      package = pkgs.nix-ld-rs;
    };
    dconf.enable = true;
  };

  fonts.packages = with pkgs; [(nerdfonts.override {fonts = ["FiraCode" "JetBrainsMono"];})];

  system.stateVersion = "23.11";
}
