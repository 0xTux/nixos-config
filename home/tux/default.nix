{ pkgs, ... }: {
  home.packages = with pkgs; [
    discord
    anydesk
    rustdesk-flutter
    nodePackages.pnpm
    vlc
    darktable
    rawtherapee
    beekeeper-studio
    arandr
    vscode-extensions.ms-vscode-remote.remote-ssh
    gimp
  ];
}
