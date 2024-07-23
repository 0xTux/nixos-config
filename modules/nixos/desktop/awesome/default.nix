{
  lib,
  pkgs,
  ...
}: {
  services = {
    displayManager = {
      sddm = {
        enable = true;
      };
    };

    xserver = {
      enable = true;
      windowManager.awesome = {
        enable = true;
        luaModules = lib.attrValues {
          inherit
            (pkgs.luajitPackages)
            lgi
            ldbus
            luadbi-mysql
            luaposix
            dkjson
            ;
        };
      };
    };

    acpid.enable = true;
    mpd.enable = true;
    picom.enable = true;
    upower.enable = true;
    blueman.enable = true;
  };

  programs.dconf.enable = true;

  environment.systemPackages = with pkgs; [
    luajit
    wezterm
    acpi
    linuxKernel.packages.linux_zen.acpi_call
    lxappearance
    jq
    inotify-tools
    polkit_gnome
    xdotool
    xclip
    xorg.xbacklight
    gpick
    ffmpeg
    alsa-utils
    pavucontrol
    brightnessctl
    libnotify
    feh
    maim
    mpv
    mpd
    mpc-cli
    mpdris2
    python311
    python311Packages.mutagen
    ncmpcpp
    xdg-utils
    playerctl
    pulsemixer
    procps
    sct
    slop
    speedcrunch
  ];
}
