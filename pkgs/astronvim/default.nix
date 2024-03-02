{
  lib,
  stdenv,
  pkgs,
}: let
  user = ./user;
in
  stdenv.mkDerivation {
    pname = "astronvim";
    version = "3.44.1";

    src = pkgs.fetchFromGitHub {
      owner = "AstroNvim";
      repo = "AstroNvim";
      rev = "refs/heads/main";
      sha256 = "sha256-1nfMx9XaTOfuz1IlvepJdEfrX539RRVN5RXzUR00tfk=";
    };

    installPhase = ''
      mkdir $out
      cp -r * "$out/"
      mkdir -p "$out/lua/user"
      cp -r ${user}/* "$out/lua/user/"
    '';

    meta = with lib; {
      description = "AstroNvim";
      homepage = "https://github.com/AstroNvim/AstroNvim";
      platforms = platforms.all;
      license = licenses.gpl3;
    };
  }
