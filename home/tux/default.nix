{ pkgs, ... }: {
  home.packages = with pkgs; [
    discord
    anydesk
    nodePackages.pnpm
    vlc
    darktable
    rawtherapee
  ];
}
