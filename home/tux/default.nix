{pkgs, ...}: {
  home.packages = with pkgs; [
    discord
    telegram-desktop
    anydesk
    rustdesk-flutter
    vlc
    darktable
    rawtherapee
    beekeeper-studio
    gimp
    obs-studio
    flameshot
    chromium
  ];
}
