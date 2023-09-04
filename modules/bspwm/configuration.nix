{ pkgs, username, ... }:

{
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.displayManager.defaultSession = "none+bspwm";
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "${username}";
  services.xserver.windowManager.bspwm.enable = true;

  environment.systemPackages = with pkgs; [
    sxhkd
    polybar
    picom-jonaburg
    papirus-icon-theme
    rofi
    dunst
    tdrop
    pavucontrol
    libsForQt5.bismuth
    nitrogen
    feh
    viewnior
    networkmanager_dmenu
    gvfs
    weston
    bibata-cursors
    dracula-theme
    dracula-icon-theme
    eww
    rustup
    kitty
    brightnessctl
    lsd
    jq
    playerctl
    mopidy
    mopidy-mpd
    mopidy-spotify
    mopidy-mopify
    ncmpcpp
    xdotool
    ueberzug
    maim
    pamixer
    xdg-user-dirs
    webp-pixbuf-loader
    xorg.xprop
    physlock
    jetbrains-mono
    terminus-nerdfont
    inconsolata
    joypixels
  ];
}
