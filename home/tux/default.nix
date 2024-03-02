{pkgs, ...}: {
  home.packages = with pkgs; [
    discord
    anydesk
    rustdesk-flutter
    nodePackages.pnpm
    nodePackages.yarn
    vlc
    darktable
    rawtherapee
    beekeeper-studio
    arandr
    vscode-extensions.ms-vscode-remote.remote-ssh
    gimp
  ];
}
