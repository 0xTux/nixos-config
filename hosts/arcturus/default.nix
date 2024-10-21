{
  pkgs,
  username,
  config,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../common
    ../../modules/nixos/postgresql.nix
    ../../modules/nixos/headscale.nix
    ../../modules/nixos/vaultwarden.nix
    ../../modules/nixos/gitea.nix
    ../../modules/nixos/plausible.nix
    ../../modules/nixos/monitoring/grafana.nix
    ../../modules/nixos/monitoring/loki.nix
    ../../modules/nixos/monitoring/promtail.nix
    ../../modules/nixos/ntfy-sh.nix
    ../../modules/nixos/searx.nix
    ../../modules/nixos/wakapi.nix
    ../../modules/nixos/nextcloud.nix
  ];

  sops.secrets = {
    borg_encryption_key = {
      sopsFile = ./secrets.yaml;
    };

    searx_secret_key = {
      sopsFile = ./secrets.yaml;
    };

    "cloudflare_credentials/email" = {
      sopsFile = ./secrets.yaml;
    };

    "cloudflare_credentials/dns_api_token" = {
      sopsFile = ./secrets.yaml;
    };

    plausible_password = {
      sopsFile = ./secrets.yaml;
    };

    plausible_key = {
      sopsFile = ./secrets.yaml;
    };

    wakapi_salt = {
      sopsFile = ./secrets.yaml;
    };

    nextcloud_password = {
      sopsFile = ./secrets.yaml;
      owner = "nextcloud";
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
    hostName = "arcturus";

    firewall = {
      enable = true;
      allowedTCPPorts = [80 443 22 3333];
    };
  };

  security = {
    sudo.wheelNeedsPassword = false;

    acme = {
      acceptTerms = true;
      defaults.email = "0xtux@pm.me";
      certs = {
        "tux.rs" = {
          domain = "*.tux.rs";
          extraDomainNames = ["tux.rs"];
          dnsProvider = "cloudflare";
          credentialFiles = {
            CLOUDFLARE_EMAIL_FILE = config.sops.secrets."cloudflare_credentials/email".path;
            CLOUDFLARE_DNS_API_TOKEN_FILE = config.sops.secrets."cloudflare_credentials/dns_api_token".path;
          };
        };
      };
    };
  };

  users.users.nginx.extraGroups = ["acme"];

  services = {
    nginx = {
      recommendedTlsSettings = true;
      recommendedBrotliSettings = true;
      recommendedOptimisation = true;
      recommendedGzipSettings = true;
      recommendedProxySettings = true;
      recommendedZstdSettings = true;
    };

    borgbackup.jobs.arcturus-backup = {
      paths = [
        "/var/lib/bitwarden_rs"
        "/var/lib/gitea"
        "/var/lib/headscale"
        "/var/lib/grafana"
        "/var/lib/loki"
        "/var/lib/private/ntfy-sh"
      ];
      encryption = {
        mode = "repokey-blake2";
        passCommand = "cat ${config.sops.secrets.borg_encryption_key.path}";
      };
      environment.BORG_RSH = "ssh -i /home/${username}/.ssh/storagebox";
      repo = "ssh://u416910@u416910.your-storagebox.de:23/./arcturus-backups";
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

  environment.persistence."/persist" = {
    enable = false;
  };

  home-manager.users.${username} = {
    imports = [
      ./home.nix
    ];
  };

  system.stateVersion = "23.11";
}
