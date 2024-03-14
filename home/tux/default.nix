{pkgs, ...}: {
  home.packages = with pkgs; [
    discord
    telegram-desktop
    anydesk
    rustdesk-flutter
    nodePackages.pnpm
    nodePackages.yarn
    vlc
    darktable
    rawtherapee
    beekeeper-studio
    arandr
    gimp
    obs-studio
  ];
}
