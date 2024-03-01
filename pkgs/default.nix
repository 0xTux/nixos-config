{ pkgs, ... }: {
  speedtestpp = pkgs.callPackage ./speedtestpp { };
  nvchad = pkgs.callPackage ./nvchad { };
  astronvim = pkgs.callPackage ./astronvim { };
}
