{pkgs, ...}: {
  programs = {
    bat.enable = true;
    zsh = {
      enable = true;
      shellAliases = {
        ls = "lsd";
      };
      syntaxHighlighting.enable = true;
      autosuggestion.enable = true;
      initExtra = ''
        nitch
        export WINIT_X11_SCALE_FACTOR=1
        bindkey "^A" vi-beginning-of-line
        bindkey "^E" vi-end-of-line
      '';
    };
    lazygit.enable = true;
    zoxide = {
      enable = true;
      options = ["--cmd cd"];
    };
    ripgrep.enable = true;
    btop = {
      enable = true;
      settings = {
        theme_background = false;
        update_ms = 1000;
        presets = "cpu:0:default mem:0:default net:0:default";
      };
    };
    go.enable = true;
    yazi = {
      enable = true;
      enableZshIntegration = true;
    };
    cava.enable = true;
  };

  home.packages = with pkgs; [
    lsd
    nitch
    ranger
    wget
    portal
    bore-cli
    fast-cli
    gdu
    zip
    unzip
    pciutils
    gnumake
    copyq
    zellij
    cht-sh
    nix-output-monitor
    fzf
    duf
    jq

    python311
    nodejs
    nodePackages.pnpm
    nodePackages.yarn
    rustup
    bun
    nixpkgs-fmt
    flyctl
    turso-cli

    hunspell
    hunspellDicts.en_US
    galaxy-buds-client
    air
    templ
  ];
}
