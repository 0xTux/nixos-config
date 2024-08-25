{
  pkgs,
  username,
  config,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../common
    ../../modules/nixos/headscale.nix
    ../../modules/nixos/vaultwarden.nix
    ../../modules/nixos/uptime-kuma.nix
    ../../modules/nixos/gitea.nix
    ../../modules/nixos/monitoring/grafana.nix
    ../../modules/nixos/monitoring/loki.nix
    ../../modules/nixos/monitoring/promtail.nix
    ../../modules/nixos/ntfy-sh.nix
    ../../modules/nixos/searx.nix
  ];

  sops.secrets = {
    borg_encryption_key = {
      sopsFile = ./secrets.yaml;
    };

    searx_secret_key = {
      sopsFile = ./secrets.yaml;
    };
  };

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

  services = {
    borgbackup.jobs.controller-backup = {
      paths = [
        "/var/lib/bitwarden_rs"
        "/var/lib/gitea"
        "/var/lib/headscale"
        "/var/lib/grafana"
        "/var/lib/loki"
        "/var/lib/private/ntfy-sh"
        "/var/lib/private/uptime-kuma"
      ];
      encryption = {
        mode = "repokey-blake2";
        passCommand = "cat ${config.sops.secrets.borg_encryption_key.path}";
      };
      environment.BORG_RSH = "ssh -i /home/${username}/.ssh/storagebox";
      repo = "ssh://u416910@u416910.your-storagebox.de:23/./controller-backups";
      compression = "auto,zstd";
      startAt = "daily";
    };
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
