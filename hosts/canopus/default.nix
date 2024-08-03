{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nixos-hardware.nixosModules.asus-zephyrus-ga503
    ./hardware-configuration.nix
    ../../modules/nixos/default.nix
    ../../modules/nixos/desktop/awesome
    ../../modules/nixos/desktop/hyprland
    ../../modules/nixos/virtualisation
    ../../modules/nixos/steam.nix
  ];

  nixpkgs.config.cudaSupport = true;

  networking = {
    hostName = "canopus";
    networkmanager = {
      enable = true;
      wifi.powersave = false;
    };
    firewall = {
      enable = true;
      allowedTCPPorts = [80 443 3000 6666 8081];
      allowedTCPPortRanges = [
        {
          from = 1714;
          to = 1764;
        }
      ];
      allowedUDPPortRanges = [
        {
          from = 1714;
          to = 1764;
        }
      ];
    };
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    supportedFilesystems = ["ntfs"];
    initrd.systemd.enable = true;

    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 5;
      };
      efi.canTouchEfiVariables = true;
      timeout = 1;
    };
  };

  hardware = {
    bluetooth.enable = true;
    bluetooth.powerOnBoot = true;
    graphics.enable32Bit = true;
  };

  security = {
    sudo.wheelNeedsPassword = false;
    polkit.enable = true;
    rtkit.enable = true;
  };

  systemd = {
    enableEmergencyMode = false;

    user = {
      services.polkit-gnome-authentication-agent-1 = {
        description = "polkit-gnome-authentication-agent-1";
        wantedBy = ["graphical-session.target"];
        wants = ["graphical-session.target"];
        after = ["graphical-session.target"];
        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
      };
    };
  };

  programs = {
    ssh.startAgent = true;
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [thunar-archive-plugin thunar-volman];
    };
    nix-ld = {
      enable = true;
      package = pkgs.nix-ld-rs;
    };
    nm-applet.enable = true;
    noisetorch.enable = true;
  };

  services = {
    resolved.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    logind = {
      extraConfig = "HandlePowerKey=suspend";
      lidSwitch = "suspend";
      lidSwitchExternalPower = "suspend";
    };

    syncthing = {
      enable = true;
      user = "tux";
      dataDir = "/home/tux/";
      openDefaultPorts = true;
    };

    xserver = {
      enable = true;
      xkb = {
        layout = "in";
        variant = "eng";
      };
    };

    libinput.touchpad.naturalScrolling = true;

    # To use Auto-cpufreq we need to
    # disable TLP because it's enabled by nixos-hardware
    tlp.enable = false;
    auto-cpufreq = {
      enable = true;
      settings = {
        battery = {
          governor = "powersave";
          turbo = "never";
          scaling_min_freq = 400000;
          scaling_max_freq = 2800000;
        };
        charger = {
          governor = "powersave";
          turbo = "never";
          scaling_max_freq = 3300000;
        };
      };
    };

    blueman.enable = true;

    supergfxd = {
      enable = true;
      settings = {
        mode = "Integrated";
        vfio_enable = false;
        vfio_save = false;
        always_reboot = false;
        no_logind = false;
        logout_timeout_s = 180;
        hotplug_type = "None";
      };
    };

    asusd = {
      enable = true;
      enableUserService = true;
      asusdConfig = ''
        (
          charge_control_end_threshold: 100,
          panel_od: false,
          mini_led_mode: false,
          disable_nvidia_powerd_on_battery: true,
          ac_command: "",
          bat_command: "",
          platform_policy_on_battery: Quiet,
          platform_policy_on_ac: Quiet,
          ppt_pl1_spl: None,
          ppt_pl2_sppt: None,
          ppt_fppt: None,
          ppt_apu_sppt: None,
          ppt_platform_sppt: None,
          nv_dynamic_boost: None,
          nv_temp_target: None,
        )
      '';
      profileConfig = ''
        (
          active_profile: Quiet,
        )
      '';
    };

    gvfs.enable = true;
    tumbler.enable = true;
    gnome.gnome-keyring.enable = true;
    tailscale.enable = true;
    mullvad-vpn = {
      enable = true;
      package = pkgs.mullvad-vpn;
    };
    ollama = {
      enable = true;
      acceleration = "cuda";
    };
  };

  fonts.packages = with pkgs; [(nerdfonts.override {fonts = ["FiraCode" "JetBrainsMono"];})];

  system.stateVersion = "23.11";
}
