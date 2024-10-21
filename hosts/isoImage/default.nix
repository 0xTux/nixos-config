{
  pkgs,
  modulesPath,
  inputs,
  username,
  ...
}: {
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
    inputs.home-manager.nixosModules.home-manager

    ../../modules/nixos/default.nix
    ../../modules/nixos/desktop/awesome
  ];

  nixpkgs.hostPlatform = "x86_64-linux";

  networking = {
    hostName = "iso";
  };

  hardware = {
    bluetooth.enable = true;
    bluetooth.powerOnBoot = true;
  };

  security = {
    sudo.wheelNeedsPassword = false;
    rtkit.enable = true;
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

    xserver = {
      enable = true;
      xkb = {
        layout = "in";
        variant = "eng";
      };
    };

    libinput.touchpad.naturalScrolling = true;

    blueman.enable = true;

    gvfs.enable = true;
    tumbler.enable = true;
  };

  fonts.packages = with pkgs; [(nerdfonts.override {fonts = ["FiraCode" "JetBrainsMono"];})];

  home-manager.users.${username} = {
    imports = [
      ./home.nix
    ];
  };

  system.stateVersion = "23.11";
}
