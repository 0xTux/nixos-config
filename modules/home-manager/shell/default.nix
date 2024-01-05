{ pkgs, ... }: {
  programs = {
    bat.enable = true;
    zsh = {
      enable = true;
      shellAliases = {
        ls = "lsd";
      };
      syntaxHighlighting.enable = true;
      enableAutosuggestions = true;
      initExtra = ''
        eval "$(starship init zsh)"
        nitch
        export WINIT_X11_SCALE_FACTOR=1
      '';
    };
    lazygit.enable = true;
    zoxide.enable = true;
    ripgrep.enable = true;
    btop = {
      enable = true;
      settings = {
        theme_background = false;
        update_ms = 1000;
      };
    };
    go.enable = true;
  };

  home.packages = with pkgs; [
    lsd
    nitch
    ranger
    wget
    portal
    fast-cli
    gdu
    nvtop
    zip
    unzip
    speedtestpp
    pciutils
    gnumake
    copyq
    zellij
    cht-sh

    python311
    nodejs
    rustc
    cargo
    bun
    stremio
    nixpkgs-fmt
    flyctl
    turso-cli

    libreoffice-qt
    spotify
    hunspell
    hunspellDicts.en_US
    galaxy-buds-client
  ];
}
