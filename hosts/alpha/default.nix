{
  pkgs,
  username,
  config,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../common
    ../../modules/nixos/uptime-kuma.nix
  ];

  sops.secrets = {
    borg_encryption_key = {
      sopsFile = ./secrets.yaml;
    };

    "cloudflare_credentials/email" = {
      sopsFile = ./secrets.yaml;
    };

    "cloudflare_credentials/dns_api_token" = {
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
    hostName = "alpha";

    firewall = {
      enable = true;
      allowedTCPPorts = [80 443 22];
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
      recommendedGzipSettings = true;
      recommendedOptimisation = true;
      recommendedProxySettings = true;
      recommendedTlsSettings = true;
    };

    borgbackup.jobs.alpha-backup = {
      paths = [
        "/var/lib/private/uptime-kuma"
      ];
      encryption = {
        mode = "repokey-blake2";
        passCommand = "cat ${config.sops.secrets.borg_encryption_key.path}";
      };
      environment.BORG_RSH = "ssh -i /home/${username}/.ssh/storagebox";
      repo = "ssh://u416910@u416910.your-storagebox.de:23/./alpha-backups";
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
