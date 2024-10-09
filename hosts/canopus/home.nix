{
  pkgs,
  username,
  ...
}: {
  imports = [
    ../common/home.nix
    ../../modules/home-manager/awesome
    ../../modules/home-manager/hyprland
    ../../modules/home-manager/waybar
    ../../modules/home-manager/picom
    ../../modules/home-manager/alacritty
    ../../modules/home-manager/wezterm
    ../../modules/home-manager/rofi
    ../../modules/home-manager/barrier
    ../../modules/home-manager/firefox
    ../../modules/home-manager/kdeconnect
    ../../modules/home-manager/vs-code
    ../../modules/home-manager/mopidy
    ../../modules/home-manager/thunderbird
  ];

  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
  };

  qt.enable = true;
  qt.platformTheme.name = "gtk";
  qt.style.name = "adwaita-dark";
  qt.style.package = pkgs.adwaita-qt;

  gtk = {
    enable = true;
    theme = {
      name = "Materia-dark";
      package = pkgs.materia-theme;
    };
    iconTheme = {
      package = pkgs.tela-icon-theme;
      name = "Tela-black";
    };
  };

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
    libreoffice-qt
    spotify
    stremio
    galaxy-buds-client
    mailspring
  ];

  home.persistence."/persist/home/${username}" = {
    directories = [
      "Downloads"
      "Music"
      "Wallpapers"
      "Documents"
      "Videos"
      "Projects"
      "Stuff"
      ".mozilla"
      ".ssh"
      ".local/share/nvim"
      ".local/share/zoxide"
      ".local/share/Smart\ Code\ ltd"
    ];
    files = [
      ".zsh_history"
      ".zcompdump"
      ".wakatime.cfg"
    ];
    allowOther = true;
  };

  home.stateVersion = "24.11";
}
