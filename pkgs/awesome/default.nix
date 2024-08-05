{
  stdenv,
  lib,
}: let
  awesome = ./awesome;
in
  stdenv.mkDerivation {
    pname = "tux-awesome-wm-config";
    version = "0.1.0";

    buildCommand = ''
      mkdir -p $out
      cp -r ${awesome}/* "$out/"
    '';

    meta = with lib; {
      description = "tux's awesome-wm config";
      homepage = "https://tux.rs";
      platforms = platforms.all;
      license = licenses.gpl3;
    };
  }
