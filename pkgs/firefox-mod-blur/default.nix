{
  lib,
  stdenv,
  pkgs,
}:
stdenv.mkDerivation {
  pname = "firefox-mod-blur";
  version = "v2.7.8";

  src = pkgs.fetchFromGitHub {
    owner = "datguypiko";
    repo = "Firefox-Mod-Blur";
    rev = "refs/heads/master";
    sha256 = "sha256-7wvQABKZ9Cc7UYgZRA9l7kKtpMsrMlBWM9q70CvQSJY=";
  };

  installPhase = ''
    mkdir $out
    cp -r * "$out/"
    cp -r "$out/EXTRA MODS/Bookmarks Bar Mods/Bookmarks bar same color as toolbar/bookmarks_bar_same_color_as_toolbar.css" "$out/"
    cp -r "$out/EXTRA MODS/Search Bar Mods/Search box - No search engine buttons/no_search_engines_in_url_bar.css" "$out/"
  '';

  meta = with lib; {
    description = "Firefox Mod Blur";
    homepage = "https://github.com/datguypiko/Firefox-Mod-Blur";
    platforms = platforms.all;
    license = licenses.gpl3;
  };
}
