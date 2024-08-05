{pkgs, ...}: {
  tux-awesome-wm-config = pkgs.callPackage ./awesome {};
  nvchad = pkgs.callPackage ./nvchad {};
  astronvim = pkgs.callPackage ./astronvim {};
  firefox-mod-blur = pkgs.callPackage ./firefox-mod-blur {};
}
