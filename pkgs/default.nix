{pkgs, ...}: {
  nvchad = pkgs.callPackage ./nvchad {};
  astronvim = pkgs.callPackage ./astronvim {};
}
