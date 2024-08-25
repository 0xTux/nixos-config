{
  pkgs,
  lib,
  ...
}: {
  services = {
    searx = {
      enable = true;
      package = pkgs.searxng;
      environmentFile = "/run/secrets/searx_secret_key";
      settings = {
        general = {
          instance_name = "SearXNG";
        };
        server = {
          bind_address = "0.0.0.0";
          port = 3415;
          base_url = "https://sx.tux.rs";
          secret_key = "@secret_key@";
        };
      };
    };

    nginx = {
      enable = lib.mkForce true;
      virtualHosts = {
        "sx.tux.rs" = {
          forceSSL = true;
          enableACME = true;
          locations = {
            "/" = {
              proxyPass = "http://localhost:3415";
            };
          };
        };
      };
    };
  };
}
