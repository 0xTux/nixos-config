{
  lib,
  buildGoModule,
  fetchFromGitHub,
  ...
}: let
  version = "2.0.1";
in
  buildGoModule {
    pname = "go-wol";
    inherit version;

    src = fetchFromGitHub {
      owner = "sabhiram";
      repo = "go-wol";
      rev = "v${version}";
      hash = "sha256-iV3p0PjRK0ItfOaRJoS30iZC+O3lNPWfcRb3pfv60RY=";
    };

    vendorHash = "sha256-Ze928UnuvScA32fglTYkQx+XE15BxSB6vNa9OSyhN3w=";

    meta = with lib; {
      homepage = "https://github.com/sabhiram/go-wol";
      description = "Simple wake on LAN magic packet generator for golang";
      license = licenses.mit;
    };
  }
