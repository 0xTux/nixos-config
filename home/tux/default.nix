{ pkgs, ... }: {
  home.packages = with pkgs; [
    discord
    anydesk
    nodePackages.pnpm
    vlc
    darktable
    rawtherapee
    beekeeper-studio
    arandr
    vscode-extensions.ms-vscode-remote.remote-ssh
  ];
}
