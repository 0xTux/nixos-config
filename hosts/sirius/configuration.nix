{ pkgs, pkgs-unstable, username, hostname, ... }:

{
  imports =
    [
      ./hardware-configuration.nix

      ../../modules/bspwm/configuration.nix
      ../../modules/hyprland/configuration.nix

      ../../modules/virtualisation/waydroid.nix
      ../../modules/virtualisation/qemu.nix

      ../../modules/hardware/nvidia.nix
      ../../modules/hardware/bluetooth.nix
    ];

  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_IN";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  xdg.portal.enable = true;
  sound.enable = true;

  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    supportedFilesystems = [ "ntfs" ];
    initrd.systemd.enable = true;
    initrd.network.enable = true;

    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 5;
      };
      efi.canTouchEfiVariables = true;
      timeout = 1;
    };
    plymouth = {
      enable = true;
      theme = "breeze";
    };
  };

  networking = {
    hostName = "${hostname}";
    networkmanager.enable = true;
  };

  security = {
    polkit.enable = true;
    sudo.wheelNeedsPassword = false;
    rtkit.enable = true;
  };

  hardware = {
    nvidia.prime.nvidiaBusId = "PCI:1:0:0";
    nvidia.prime.amdgpuBusId = "PCI:7:0:0";
    pulseaudio.enable = true;
    pulseaudio.support32Bit = true;
  };

  systemd = {
    enableEmergencyMode = false;

    user = {
      services.polkit-gnome-authentication-agent-1 = {
        description = "polkit-gnome-authentication-agent-1";
        wantedBy = [ "graphical-session.target" ];
        wants = [ "graphical-session.target" ];
        after = [ "graphical-session.target" ];
        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
      };

      # services.barrier = {
      #   description = "Barrier KVM Client";
      #   wantedBy = [ "graphical.target" ];
      #   wants = [ "network-online.target" ];
      #   after = [ "network-online.target" ];
      #   serviceConfig = {
      #     Type = "simple";
      #     ExecStart = "${pkgs.barrier}/bin/barrierc -f --debug INFO --display :0 --name esoteric --disable-crypto 192.168.1.2:24800";
      #     Restart = "always";
      #     RestartSec = 3;
      #   };
      # };
    };
  };

  services = {
    logind = {
      extraConfig = "HandlePowerKey=suspend";
      lidSwitch = "suspend";
      lidSwitchExternalPower = "suspend";
    };

    syncthing = {
      enable = true;
      user = "tux";
      dataDir = "/home/tux/";
    };

    mopidy = {
      enable = true;
      extensionPackages = [ pkgs.mopidy-mpd pkgs.mopidy-spotify pkgs.mopidy-mopify ];
    };

    xserver = {
      enable = true;
      layout = "in";
      xkbVariant = "eng";
      libinput.touchpad.naturalScrolling = true;
    };

    supergfxd.enable = true;

    asusd = {
      enable = true;
      enableUserService = true;
      asusdConfig = "bat_charge_limit: 80";
    };

    gvfs.enable = true;
    tumbler.enable = true;
    flatpak.enable = true;
    gnome.gnome-keyring.enable = true;
    tailscale.enable = true;
  };

  programs = {
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [ thunar-archive-plugin thunar-volman ];
    };
    steam = {
      enable = true;
    };
    nix-ld.enable = true;
  };

  nixpkgs = {
    config = {
      pulseaudio = true;
      permittedInsecurePackages = [
        "python-2.7.18.6"
      ];
    };

    overlays = [
      (final: prev: {
        vscode = prev.vscode.overrideAttrs (oldAttrs: rec {
          src = (builtins.fetchTarball {
            url = "https://code.visualstudio.com/sha/download?build=stable&os=linux-x64";
            sha256 = "09hy3nw1bblrl0blzpwv492gy0hwwbaq4csx00mcymskginz1wyx";
          });
          version = "latest";
          buildInputs = oldAttrs.buildInputs ++ [ pkgs.krb5 ];
        });
      })
    ];
  };

  environment.systemPackages = with pkgs; [

    barrier
    lxappearance
    service-wrapper
    polkit_gnome

    libreoffice-qt
    wezterm
    firefox
    brave
    discord
    starship
    telegram-desktop
    parsec-bin
    steam
    spotify
    geany
    galaxy-buds-client
    anydesk
    beekeeper-studio
    vlc
    retroarch
    qbittorrent
    blender
    neovide
    vscode

    colorpicker
    scrcpy
    nixpkgs-fmt

  ];
}
