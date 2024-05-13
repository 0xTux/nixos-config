{
  lib,
  stdenv,
  pkgs,
}:
stdenv.mkDerivation {
  pname = "firefox-mod-blur";
  version = "v2.7.6";

  src = pkgs.fetchFromGitHub {
    owner = "datguypiko";
    repo = "Firefox-Mod-Blur";
    rev = "refs/heads/master";
    sha256 = "sha256-9dPL+pVnOsAxzFWRjSk+RSe+x/CKQk3iQAyQDBrVE9U=";
  };

  installPhase = ''
    mkdir $out
    cp -r * "$out/"
  '';

  meta = with lib; {
    description = "Firefox Mod Blur";
    homepage = "https://github.com/datguypiko/Firefox-Mod-Blur";
    platforms = platforms.all;
    license = licenses.gpl3;
  };
}
