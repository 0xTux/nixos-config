{pkgs, ...}: {
  tux-awesome-wm-config = pkgs.callPackage ./awesome {};
  tux-nvim-config = pkgs.callPackage ./nvim {};
  astronvim = pkgs.callPackage ./astronvim {};
  firefox-mod-blur = pkgs.callPackage ./firefox-mod-blur {};
}
