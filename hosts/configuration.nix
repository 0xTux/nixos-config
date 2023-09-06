{ pkgs, username, ... }:

{
  imports =
    [
      ../modules/virtualisation/docker.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];

  users = {
    defaultUserShell = pkgs.zsh;
    users.${username} = {
      initialPassword = "${username}";
      isNormalUser = true;
      extraGroups = [ "networkmanager" "wheel" "storage" "audio" ];
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL+OzPUe2ECPC929DqpkM39tl/vdNAXfsRnmrGfR+X3D 0xtux@pm.me"
      ];
    };
  };

  services = {
    openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = false;
      };
    };
  };

  programs = {
    zsh = {
      enable = true;
      ohMyZsh.enable = true;
      syntaxHighlighting.enable = true;
      autosuggestions.enable = true;
    };
    git = {
      enable = true;
      config = {
        user = {
          email = "0xtux@pm.me";
          name = "0xTux";
          signingkey = "~/.ssh/tux.pub";
        };
        commit.gpgsign = true;
        gpg.format = "ssh";
      };
    };
    starship.enable = true;
    dconf.enable = true;
    seahorse.enable = true;
    nix-ld.enable = true;
  };

  environment.systemPackages = with pkgs; [

    # Codecs
    x264
    x265

    # Runtime
    nodejs
    nodePackages.pnpm
    go
    python311
    gcc
    jdk17

    # Utils
    ranger
    nitch
    wget
    pciutils
    portal
    fast-cli
    exa
    bat
    zoxide
    ripgrep
    lazygit
    gdu
    bottom
    btop
    nvtop
    zip
    unzip

    # xorg
    xorg.xsetroot
    xorg.xwininfo
    xorg.xrandr
    xorg.xhost
    xorg.xev

  ];

  system.stateVersion = "23.05";
}
