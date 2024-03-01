{ pkgs, ... }: {
  speedtestpp = pkgs.callPackage ./speedtestpp { };
  nvchad = pkgs.callPackage ./nvchad { };
}
