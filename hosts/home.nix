{ pkgs, username, ... }:

{
  imports = [
    ../modules/alacritty/home.nix
    ../modules/nvim/home.nix
  ];

  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "23.05";

    packages = with pkgs; [ ];
  };

  programs.home-manager.enable = true;
}
