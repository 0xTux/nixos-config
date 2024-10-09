{pkgs, ...}: {
  home.file = {
    ".config/awesome" = {
      recursive = true;
      source = "${pkgs.tux-awesome-wm-config}";
    };
  };
}
