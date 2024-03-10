{
  stdenv,
  lib,
}: let
  nvim = ./nvim;
in
  stdenv.mkDerivation {
    pname = "nvchad";
    version = "2.5.0";

    buildCommand = ''
      mkdir -p $out
      cp -r ${nvim}/* "$out/"
    '';

    meta = with lib; {
      description = "NvChad";
      homepage = "https://github.com/NvChad/NvChad";
      platforms = platforms.all;
      license = licenses.gpl3;
    };
  }
