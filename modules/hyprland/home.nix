{ pkgs, ... }:

{
  # imports = [ hyprland.homeManagerModules.default ];

  xdg.configFile = {
    "hypr".source = ./config;
  };

  # wayland.windowManager.hyprland = {
  #   enable = true;
  #   xwayland.enable = true;
  # };

}
