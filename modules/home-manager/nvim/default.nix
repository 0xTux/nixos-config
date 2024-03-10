{pkgs, ...}: {
  xdg.configFile."nvim" = {
    source = "${pkgs.nvchad}";
  };

  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;

      viAlias = false;
      vimAlias = true;

      withPython3 = true;
      withNodeJs = true;
    };
  };

  home = {
    packages = with pkgs; [
      gcc
      neovide

      # nix
      nil # Language Server
      statix # Lints and suggestions
      deadnix # Find and remove unused
      alejandra # Code Formatter

      # lua
      luarocks

      gdu
      ripgrep
    ];
  };
}
